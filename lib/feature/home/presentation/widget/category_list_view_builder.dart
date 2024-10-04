import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class CategoryListViewBuilder extends StatelessWidget {
  const CategoryListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return Column(
      children: [
        Row(
          children: [
            Text(AppStrings.category,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: responsive.setTextSize(4))),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context
                    .read<AppLogicCubit>()
                    .bottomNavBarController
                    .jumpToTab(1);
              },
              child: Text(AppStrings.viewAll,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4))),
            ),
          ],
        ),
        responsive.setSizeBox(height: 3),
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is GetCategoriesSuccess) {
              return _categorySuccessState(state, responsive);
            }

            return _categoryLoadingAndErrorState(responsive);
          },
        ),
      ],
    );
  }

  SizedBox _categoryLoadingAndErrorState(ResponsiveUtils responsive) {
    return SizedBox(
      height: responsive.setHeight(15),
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: responsive.setPadding(right: 4),
            child: Column(
              children: [
                LoadingShimmer(
                  height: responsive.setHeight(8),
                  width: responsive.setWidth(18),
                  borderRadius: responsive.setBorderRadius(2),
                ),
                responsive.setSizeBox(height: 1.5),
                LoadingShimmer(
                  width: responsive.setWidth(13),
                  height: responsive.setHeight(1),
                  borderRadius: responsive.setBorderRadius(2),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox _categorySuccessState(
      GetCategoriesSuccess state, ResponsiveUtils responsive) {
    return SizedBox(
      height: responsive.setHeight(15),
      child: ListView.builder(
        addAutomaticKeepAlives: true,
        itemCount: state.data.data!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: responsive.setPadding(right: 4),
            child: InkWell(
              onTap: () {
                NavBarNavigator.push(context,
                    screen: BlocProvider(
                      create: (context) =>
                          instance<ProductBasedOnCategoryCubit>(),
                      child: ProductBaseOnCategory(
                        categoryId: state.data.data![index].sId!,
                        categoryName: state.data.data![index].title!,
                      ),
                    ),
                    withNavBar: false);
              },
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      height: responsive.setHeight(8),
                      width: responsive.setHeight(8.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              responsive.setBorderRadius(2)),
                          color: ColorManger.backgroundItem),
                      child: Padding(
                        padding: responsive.setPadding(
                            top: 1, bottom: 1, left: 1, right: 1),
                        child: CachedNetworkImage(
                          imageUrl: state.data.data![index].image!,
                          placeholder: (context, url) => LoadingShimmer(
                            height: responsive.setHeight(9),
                            width: responsive.setWidth(9),
                            borderRadius: responsive.setBorderRadius(2),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  responsive.setSizeBox(height: 1.5),
                  Text(state.data.data![index].title!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: responsive.setTextSize(3.2))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
