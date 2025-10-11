import '../../../../../../core/common/shared/shared_imports.dart'; //

class AnimatedCartItems extends StatefulWidget {
  const AnimatedCartItems({
    super.key,
    required this.cartState,
  });

  final CartState cartState;

  @override
  State<AnimatedCartItems> createState() => _AnimatedCartItemsState();
}

class _AnimatedCartItemsState extends State<AnimatedCartItems> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<GetCartItems> _oldItems = [];

  @override
  void initState() {
    super.initState();
    _oldItems = List.from(
      context.read<CartCubit>().cartData?.data?.cartItems ?? [],
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedCartItems oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newItems =
        List.from(context.read<CartCubit>().cartData?.data?.cartItems ?? []);

    if (newItems.length > _oldItems.length) {
      for (int i = 0; i < newItems.length; i++) {
        if (!_containsItem(_oldItems, newItems[i].sId ?? "")) {
          _listKey.currentState?.insertItem(
            i,
            duration: const Duration(milliseconds: 400),
          );
        }
      }
    } else if (newItems.length < _oldItems.length) {
      for (int i = 0; i < _oldItems.length; i++) {
        if (!_containsItem(
            newItems.cast<GetCartItems>(), _oldItems[i].sId ?? "")) {
          final removedItem = _oldItems[i];
          _listKey.currentState?.removeItem(
            i,
            (context, animation) =>
                _buildItem(context, removedItem, animation, removed: true),
            duration: const Duration(milliseconds: 400),
          );
        }
      }
    }

    _oldItems = newItems.cast<GetCartItems>();
  }

  bool _containsItem(List<GetCartItems> list, String id) {
    return list.any((e) => e.sId == id);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    final cartItems = context.read<CartCubit>().cartData!.data!.cartItems!;

    return Container(
      height: responsive.setHeight(7.5),
      padding: responsive.setPadding(left: 1, right: 1),
      decoration: BoxDecoration(
        color: ColorManger.brun,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(responsive.setBorderRadius(1.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: responsive.setWidth(52),
            height: responsive.setHeight(5),
            child: AnimatedList(
              key: _listKey,
              scrollDirection: Axis.horizontal,
              reverse: true,
              initialItemCount: cartItems.length,
              itemBuilder: (context, index, animation) {
                final item = cartItems[index];
                return _buildItem(context, item, animation, removed: false);
              },
            ),
          ),
          SizedBox(width: responsive.setWidth(1)),
          Container(
            margin: responsive.setMargin(top: 2, bottom: 2),
            height: responsive.setHeight(8),
            width: responsive.setWidth(0.5),
            color: ColorManger.backgroundItem.withOpacity(0.7),
          ),
          SizedBox(width: responsive.setWidth(3)),
          Text(
            "View Basket",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 12.sp, color: ColorManger.white),
          ),
          Image.asset(
            ImageAsset.basket,
            height: responsive.setIconSize(12),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    GetCartItems item,
    Animation<double> animation, {
    required bool removed,
  }) {
    final responsive = ResponsiveUtils(context);
    final isDeleting = widget.cartState is DeleteCartItemLoading &&
        (widget.cartState as DeleteCartItemLoading).id == item.sId;

    final offsetTween = Tween<Offset>(
      begin: removed ? const Offset(0, 0) : const Offset(0, 1),
      end: removed ? const Offset(1.5, 0) : Offset.zero,
    ).chain(CurveTween(curve: Curves.easeOutBack));

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: animation.drive(offsetTween),
        child: GestureDetector(
          onTap: () {
            context.read<CartCubit>().removeItem(item.sId!);
          },
          child: Container(
            margin: responsive.setMargin(right: 1),
            height: responsive.setHeight(3),
            width: responsive.setWidth(11),
            decoration: BoxDecoration(
              color: ColorManger.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: item.product?.image ?? "",
                  placeholder: (context, url) => const LoadingShimmer(),
                  errorWidget: (context, url, error) => Center(
                    child: Padding(
                      padding: responsive.setPadding(left: 5),
                      child: Icon(
                        Icons.error,
                        size: responsive.setIconSize(10),
                        color: ColorManger.brun,
                      ),
                    ),
                  ),
                ),
                isDeleting
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorManger.brun,
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
