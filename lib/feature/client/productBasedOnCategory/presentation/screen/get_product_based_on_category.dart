import '../../../../../../core/common/shared/shared_imports.dart'; //

class ProductBaseOnCategory extends StatefulWidget {
  const ProductBaseOnCategory(
      {super.key, required this.categoryId, required this.categoryName});

  final String categoryId;
  final String categoryName;

  @override
  State<ProductBaseOnCategory> createState() => _ProductBaseOnCategoryState();
}

class _ProductBaseOnCategoryState extends State<ProductBaseOnCategory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context
            .read<ProductBasedOnCategoryCubit>()
            .getProductBasedOnCategory(widget.categoryId)
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.categoryName,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 16.sp)),
      ),
      body: Stack(
        children: [
          const ProductBaseOnCategoryBody(),
          Positioned(
            left: responsive.setWidth(5),
            right: responsive.setWidth(5),
            bottom: responsive.setHeight(8),
            child: Container(
              height: responsive.setHeight(7.5),
              padding: responsive.setPadding(left: 1, right: 1),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: ColorManger.brun,
                  borderRadius:
                      BorderRadius.circular(responsive.setBorderRadius(1.5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: responsive.setWidth(52),
                    height: responsive.setHeight(5),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      // padding: responsive.setPadding(right: 1),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: responsive.setPadding(left: 2.5, right: 2.5),
                          margin: responsive.setMargin(right: 1),
                          height: responsive.setHeight(3),
                          width: responsive.setWidth(11),
                          decoration: BoxDecoration(
                              color: ColorManger.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(
                            ImageAsset.croissant,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: responsive.setWidth(1),
                  ),
                  Container(
                    margin: responsive.setMargin(top: 2, bottom: 2),
                    height: responsive.setHeight(8),
                    width: responsive.setWidth(0.5),
                    color: ColorManger.backgroundItem.withOpacity(0.7),
                  ),
                  SizedBox(
                    width: responsive.setWidth(3),
                  ),
                  Text("View Basket",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 12.sp, color: ColorManger.white)),
                  Image.asset(
                    ImageAsset.basket,
                    height: responsive.setIconSize(12),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
