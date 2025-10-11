import '../../../../../core/common/shared/shared_imports.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, this.isCategoryCartToAdmin = false});
  final bool isCategoryCartToAdmin;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Scaffold(
      appBar: AppInitialRoute.role == "admin" && isCategoryCartToAdmin == false
          ? AppBar(
              centerTitle: true,
              title: Text(context.translate(AppStrings.category),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4))),
            )
          : null,
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is GetCategoriesLoading || state is GetCategoriesError) {
            return CategoryloadingScreenWidget(
              isCategoryCartToAdmin: isCategoryCartToAdmin,
            );
          }

          return Stack(
            children: [
              CategorySuccessWidget(
                  categoryState: state,
                  isCategoryCartToAdmin: isCategoryCartToAdmin),
              LoadingOverlay(isLoading: state is CreateCategoriesLoading)
            ],
          );
        },
      ),
    );
  }
}
