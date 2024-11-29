import '../../../../../core/common/shared/shared_imports.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

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
      appBar: AppBar(
        centerTitle: true,
        title: AppInitialRoute.role == "admin"
            ? Text(context.translate(AppStrings.category),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16.sp))
            : null,
      ), // Standard app bar
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          // Check if categories are successfully fetched
          // if (state is GetCategoriesSuccess) {
          //   // Display categories in the success state
          //   return _categorySuccessState(state, context, responsive);
          // }

          // Display loading or error state while categories are being fetched or if an error occurs
          //  return _categoryLoadingAndErrorState(responsive);
          return _categorySuccessState(context, responsive, state);
        },
      ),
    );
  }
}

Padding _categoryLoadingAndErrorState(ResponsiveUtils responsive) {
  return Padding(
    padding: responsive.setPadding(left: 5, right: 5),
    child: GridView.count(
      crossAxisCount: 3, // 3 items per row
      childAspectRatio: 0.7, // Aspect ratio of the grid items
      children: List.generate(
        12, // Show 12 shimmer placeholders
        (index) => Column(
          children: [
            // First shimmer placeholder representing a category image
            LoadingShimmer(
              height: responsive.setHeight(10), // Responsive height for shimmer
              width: responsive.setWidth(25), // Responsive width for shimmer
              borderRadius: responsive.setBorderRadius(2),
            ),
            responsive.setSizeBox(height: 2), // Spacing between elements
            // Second shimmer placeholder representing a title
            LoadingShimmer(
              width: responsive.setWidth(12), // Smaller width for shimmer
              height: responsive.setHeight(0.5),
              borderRadius: responsive.setBorderRadius(2),
            ),
            responsive.setSizeBox(height: 1),
            // Third shimmer placeholder representing a smaller subtitle or detail
            LoadingShimmer(
              width: responsive.setWidth(8),
              height: responsive.setHeight(0.5),
              borderRadius: responsive.setBorderRadius(2),
            ),
          ],
        ),
      ),
    ),
  );
}

Padding _categorySuccessState(BuildContext context, ResponsiveUtils responsive,
    CategoryState categoryState) {
  final state = context.read<CategoryCubit>().categories;
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
        state.length,
        (index) => GestureDetector(
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
                      },
                      child: const Text('Edit'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      isDestructiveAction: true,
                      child: const Text('Delete'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);

                        context
                            .read<CategoryCubit>()
                            .fetchUpdateActiveOrNotCategories(
                              state[index].sId,
                              !state[index].active!,
                            );
                      },
                      child: Text(
                          state[index].active == true ? 'DeActive' : 'Active'),
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
                      categoryId: state[index].sId!,
                      categoryName: state[index].title!,
                    ),
                  ),
                ),
              );
            }
          },
          child: Stack(
            children: [
              _buildCategoryCard(state, context, responsive, index),
              if (categoryState is UpdateCategoriesLoading &&
                  categoryState.id == state[index].sId)
                Positioned(
                  top: 25,
                  left: 30,
                  child: CircularProgressIndicator(color: ColorManger.offWhite),
                ),
            ],
          ),

          //_buildCategoryCard(state, context, responsive, index),
        ),
      ),
    ),
  );
}

Widget _buildCategoryCard(List<CategoryResponseData> state,
    BuildContext context, ResponsiveUtils responsive, int index) {
  return Material(
    color: Colors.transparent,
    child: Column(
      children: [
        Container(
          height: responsive.setHeight(10),
          width: responsive.setWidth(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(responsive.setBorderRadius(2)),
            color: ColorManger.backgroundItem,
          ),
          child: Padding(
            padding: responsive.setPadding(left: 4, right: 4),
            child: CachedNetworkImage(
              imageUrl: state[index].image!,
              placeholder: (context, url) => LoadingShimmer(
                height: responsive.setHeight(10),
                width: responsive.setWidth(25),
                borderRadius: responsive.setBorderRadius(2),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        responsive.setSizeBox(height: 2),
        Text(
          state[index].title!,
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
        ),
      ],
    ),
  );
}
