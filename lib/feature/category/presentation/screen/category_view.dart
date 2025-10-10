import '../../../../../core/common/shared/shared_imports.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, this.isCategoryCartToAdmin = false});
  final bool isCategoryCartToAdmin;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    if (AppInitialRoute.role == "admin") {
      context.read<CategoryCubit>().getCategories();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Scaffold(
      appBar: AppInitialRoute.role == "admin" &&
              widget.isCategoryCartToAdmin == false
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
            return const CategoryloadingScreenWidget();
          }

          return Stack(
            children: [
              CategorySuccessWidget(
                  categoryState: state,
                  isCategoryCartToAdmin: widget.isCategoryCartToAdmin),
              LoadingOverlay(isLoading: state is CreateCategoriesLoading)
            ],
          );
        },
      ),
    );
  }
}
