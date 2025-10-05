import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/subCategory/presentation/widget/get_sub_category_loading.dart';

class GetSubCategoryDataSuccess extends StatelessWidget {
  const GetSubCategoryDataSuccess({
    super.key,
    required this.subCategories,
    required this.state,
  });

  final List<SubCategoryResponseData> subCategories;

  final SubCategoriesState state;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: const EdgeInsets.all(18),
        children: [
          ...subCategories.map((item) {
            final hasCategory = item.category != null;
            return TweenAnimationBuilder(
              key: ValueKey(item.sId),
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: 400),
              builder: (context, value, child) => Opacity(
                opacity: value,
                child: Transform.scale(
                  scale: value,
                  child: child,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  context.read<SubCategoriesCubit>().pickImage(
                       ImageSource.gallery, item.sId);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFf6efe7),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: responsive.setHeight(1.2)),
                      CachedNetworkImage(
                        imageUrl: item.image!,
                        height: responsive.setHeight(7), // Image height
                        // Load category image from network
                        placeholder: (context, url) => LoadingShimmer(
                          height: responsive
                              .setHeight(12), // Placeholder image height
                          width: responsive
                              .setWidth(12), // Placeholder image width
                          borderRadius: responsive.setBorderRadius(
                              2), // Rounded corners for placeholder
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons
                            .error), // Display error icon if image fails to load
                      ),
                      SizedBox(height: responsive.setHeight(2.5)),
                      Text(
                        item.title!,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: responsive.setTextSize(4.2),
                            ),
                      ),
                      SizedBox(height: responsive.setHeight(1.5)),
                      Text(
                        "Parent: ${item.category?.title ?? context.translate(AppStrings.notAssigned)}",
                        style: TextStyle(
                          color: hasCategory
                              ? ColorManger.brunLight
                              : ColorManger.redError,
                          fontSize: responsive.setTextSize(3.2),
                          fontFamily: FontConsistent.geLocalozedFontFamily(),
                        ),
                      ),
                      SizedBox(height: responsive.setHeight(3)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: responsive.setHeight(5),
                            width: responsive.setWidth(12),
                            decoration: BoxDecoration(
                              color: ColorManger.brownLight,
                              borderRadius: BorderRadius.circular(
                                  responsive.setBorderRadius(3)),
                            ),
                            child: InkWell(
                              onTap: () {
                                showEditAndCreateSubCategoryDialog(
                                    context,
                                    item,
                                    context.read<SubCategoriesCubit>(),
                                    context.read<CategoryCubit>());
                              },
                              child: Center(
                                  child: Icon(
                                Icons.edit,
                                color: ColorManger.brun,
                              )),
                            ),
                          ),
                          SizedBox(width: responsive.setWidth(10)),
                          Container(
                            height: responsive.setHeight(5),
                            width: responsive.setWidth(12),
                            decoration: BoxDecoration(
                              color: ColorManger.brownLight,
                              borderRadius: BorderRadius.circular(
                                  responsive.setBorderRadius(3)),
                            ),
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<SubCategoriesCubit>()
                                    .fetchDeleteSubCategories(item.sId);
                              },
                              child: Center(
                                  child: Icon(
                                Icons.delete_outline_rounded,
                                color: item.active == true
                                    ? ColorManger.redError
                                    : ColorManger.brunLight,
                              )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
          if (state is SubCategoriesLoadingFromPagination) ...[
            const GetSubCategoryDataLoadingBodyWidget(),
            const GetSubCategoryDataLoadingBodyWidget(),
          ],
        ]);
  }
}
