import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/client/category/presentation/widget/build_category_card.dart';
import 'package:elminiawy/feature/client/category/presentation/widget/show_add_category_dialog.dart';
import 'package:elminiawy/feature/client/category/presentation/widget/show_edit_popup.dart';

class CategorySuccessWidget extends StatelessWidget {
  const CategorySuccessWidget({
    super.key,
    required this.categoryState,
  });

  final CategoryState categoryState;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    final allCategories = context.read<CategoryCubit>().categories;
    final category = AppInitialRoute.role == "admin"
        ? allCategories
        : allCategories.where((cat) => cat.active == true).toList();
    return Padding(
      padding: responsive.setPadding(
          left: 5, right: 5, top: AppInitialRoute.role == "admin" ? 2 : 0),
      child: GridView.count(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        children: List.generate(
          AppInitialRoute.role == "admin"
              ? category.length + 1
              : category.length,
          (index) {
            if (AppInitialRoute.role == "admin" && index == 0) {
              return GestureDetector(
                onTap: () {
                  showAddCategoryDialog(context);
                },
                child: const BuildCategoryCard(
                  category: null,
                ),
              );
            } else {
              final actualIndex =
                  AppInitialRoute.role == "admin" ? index - 1 : index;

              return GestureDetector(
                onTap: () {
                  if (AppInitialRoute.role == "admin") {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) => CupertinoActionSheet(
                        title: const Text("Actions"),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              showEditPopup(
                                category[actualIndex],
                                context,
                              );
                            },
                            child: const Text('Edit'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              context.read<CategoryCubit>().pickImage(
                                    ImageSource.gallery,
                                    category[actualIndex].sId,
                                  );
                            },
                            child: const Text('Edit Image'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              context
                                  .read<CategoryCubit>()
                                  .fetchUpdateActiveOrNotCategories(
                                    category[actualIndex].sId,
                                    !category[actualIndex].active!,
                                  );
                            },
                            child: Text(category[actualIndex].active == true
                                ? 'DeActive'
                                : 'Active'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              context
                                  .read<CategoryCubit>()
                                  .fetchDeleteCategories(
                                    category[actualIndex].sId,
                                  );
                            },
                            isDestructiveAction: true,
                            child: const Text('Delete'),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                    );
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
