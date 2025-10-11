import '../../../../../../core/common/shared/shared_imports.dart';
import '../widget/animated_cart_items.dart';

class ViewBasketCartWidget extends StatelessWidget {
  const ViewBasketCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final hasItems =
            context.read<CartCubit>().cartData!.data!.cartItems!.isNotEmpty;

        return Positioned(
          left: responsive.setWidth(5),
          right: responsive.setWidth(5),
          bottom: responsive.setHeight(8),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeOutBack,
            switchOutCurve: Curves.easeInBack,
            transitionBuilder: (child, animation) {
              final slide = Tween<Offset>(
                begin: const Offset(0.5, -2),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutBack,
              ));

              final scale = Tween<double>(
                begin: 0.8,
                end: 1,
              ).animate(animation);

              return SlideTransition(
                position: slide,
                child: ScaleTransition(
                  scale: scale,
                  child: child,
                ),
              );
            },
            child: hasItems
                ? AnimatedCartItems(
                    key: const ValueKey("basketVisible"), cartState: state)
                : const SizedBox(
                    key: ValueKey("basketHidden"),
                  ),
          ),
        );
      },
    );
  }
}
