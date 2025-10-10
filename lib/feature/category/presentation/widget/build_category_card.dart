import 'package:elminiawy/core/common/shared/shared_imports.dart';

class BuildCategoryCard extends StatelessWidget {
  const BuildCategoryCard({
    super.key,
    this.category,
    required this.isCategoryCartToAdmin,
  });

  final CategoryResponseData? category;
  final bool isCategoryCartToAdmin;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Material(
      color: const Color.fromARGB(0, 27, 14, 14),
      child: Column(
        children: [
          Container(
            height: responsive.setHeight(10),
            width: responsive.setWidth(25),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(responsive.setBorderRadius(2)),
              color: ColorManger.backgroundItem,
            ),
            child: Padding(
              padding: responsive.setPadding(left: 4, right: 4),
              child: category == null
                  ? Image.asset(
                      ImageAsset.upload,
                      color: ColorManger.grey.withAlpha(80),
                    )
                  : CachedNetworkImage(
                      imageUrl: category!.image!,
                      placeholder: (context, url) => LoadingShimmer(
                        height: responsive.setHeight(4),
                        width: responsive.setWidth(25),
                        borderRadius: responsive.setBorderRadius(2),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
            ),
          ),
          responsive.setSizeBox(height: 2),
          Text(
            category == null
                ? context.translate(AppStrings.addNew)
                : category!.title!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: responsive.setTextSize(3)),
          ),
          responsive.setSizeBox(height: 1),
          LoadingShimmer(
            width: responsive.setWidth(8),
            height: responsive.setHeight(0.5),
            borderRadius: responsive.setBorderRadius(2),
            baseColor: AppInitialRoute.role == "admin" &&
                    isCategoryCartToAdmin == false
                ? category == null
                    ? null
                    : category!.active == true
                        ? Colors.green.shade600
                        : Colors.red.shade600
                : null,
            highlightColor: AppInitialRoute.role == "admin" &&
                    isCategoryCartToAdmin == false
                ? category == null
                    ? null
                    : category!.active == true
                        ? Colors.green.shade200
                        : Colors.red.shade200
                : null,
          ),
        ],
      ),
    );
  }
}
