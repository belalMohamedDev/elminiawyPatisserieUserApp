import 'package:elminiawy/core/common/shared/shared_imports.dart';

class CategorySuccessWidget extends StatelessWidget {
  const CategorySuccessWidget({
    super.key,
    required this.categoryState,
    required this.isCategoryCartToAdmin,
  });

  final CategoryState categoryState;
  final bool isCategoryCartToAdmin;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    final allCategories = context.read<CategoryCubit>().categories;
    final category =
        AppInitialRoute.role == "admin" && isCategoryCartToAdmin == false
            ? allCategories
            : allCategories.where((cat) => cat.active == true).toList();
    return Padding(
      padding: responsive.setPadding(
          left: 5,
          right: 5,
          top: AppInitialRoute.role == "admin" && isCategoryCartToAdmin == false
              ? 2
              : 5),
      child: GridView.count(
        addAutomaticKeepAlives: true,
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        children: List.generate(
          AppInitialRoute.role == "admin" && isCategoryCartToAdmin == false
              ? category.length + 1
              : category.length,
          (index) {
            if (AppInitialRoute.role == "admin" &&
                isCategoryCartToAdmin == false &&
                index == 0) {
              return GestureDetector(
                onTap: () {
                  showAddCategoryDialog(context);
                },
                child: BuildCategoryCard(
                  category: null,
                  isCategoryCartToAdmin: isCategoryCartToAdmin,
                ),
              );
            } else {
              final actualIndex = AppInitialRoute.role == "admin" &&
                      isCategoryCartToAdmin == false
                  ? index - 1
                  : index;

              return GestureDetector(
                onTap: () {
                  if (AppInitialRoute.role == "admin" &&
                      isCategoryCartToAdmin == false) {
                    showEditCategoryActionDialog(
                        context, category[actualIndex]);
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (context) =>
                                  instance<ProductBasedOnCategoryCubit>(),
                            ),
                            BlocProvider.value(
                              value: instance<CartCubit>(),
                            ),
                            BlocProvider.value(
                              value: instance<WishListCubit>(),
                            ),
                          ],
                          child: ProductBaseOnCategory(
                            categoryId: category[actualIndex].sId!,
                            categoryName: category[actualIndex].title!,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: Stack(
                  children: [
                    BuildCategoryCard(
                      category: category[actualIndex],
                      isCategoryCartToAdmin: isCategoryCartToAdmin,
                    ),
                    if (categoryState is UpdateCategoriesLoading &&
                        (categoryState as UpdateCategoriesLoading).id ==
                            category[actualIndex].sId)
                      Positioned(
                        top: 25,
                        left: 30,
                        child: CircularProgressIndicator(
                            color: category[actualIndex].active == true
                                ? Colors.red.shade200
                                : Colors.green.shade200),
                      ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
