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
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is GetCategoriesLoading || state is GetCategoriesError) {
            return _categoryLoadingAndErrorState(responsive);
          }

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
      crossAxisCount: 3,
      childAspectRatio: 0.7,
      children: List.generate(
        12,
        (index) => Column(
          children: [
            LoadingShimmer(
              height: responsive.setHeight(10),
              width: responsive.setWidth(25),
              borderRadius: responsive.setBorderRadius(2),
            ),
            responsive.setSizeBox(height: 2),
            LoadingShimmer(
              width: responsive.setWidth(12),
              height: responsive.setHeight(0.5),
              borderRadius: responsive.setBorderRadius(2),
            ),
            responsive.setSizeBox(height: 1),
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
  final category = context.read<CategoryCubit>().categories;
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
        category.length,
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

                        showEditPopup(
                          category[index],
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
                              category[index].sId,
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
                              category[index].sId,
                              !category[index].active!,
                            );
                      },
                      child: Text(category[index].active == true
                          ? 'DeActive'
                          : 'Active'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<CategoryCubit>().fetchDeleteCategories(
                              category[index].sId,
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
                      categoryId: category[index].sId!,
                      categoryName: category[index].title!,
                    ),
                  ),
                ),
              );
            }
          },
          child: Stack(
            children: [
              _buildCategoryCard(
                category[index],
                context,
                responsive,
              ),
              if (categoryState is UpdateCategoriesLoading &&
                  categoryState.id == category[index].sId)
                Positioned(
                  top: 25,
                  left: 30,
                  child: CircularProgressIndicator(
                      color: category[index].active == true
                          ? Colors.red.shade200
                          : Colors.green.shade200),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}

void showEditPopup(CategoryResponseData category, BuildContext context) {
  final responsive = ResponsiveUtils(context);

  showCupertinoModalPopup(
    context: context,
    builder: (_) => CupertinoActionSheet(
      title: Text("Edit ${category.title} Category"),
      message: Column(
        children: [
          responsive.setSizeBox(height: 2),
          CupertinoTextField(
            controller: context.read<CategoryCubit>().arTitleController,
            placeholder: "Enter Arabic Title",
            style: const TextStyle(fontSize: 16, color: CupertinoColors.black),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 0.6,
              ),
            ),
          ),
          responsive.setSizeBox(height: 2),
          CupertinoTextField(
            controller: context.read<CategoryCubit>().enTitleController,
            placeholder: "Enter English Title",
            style: const TextStyle(fontSize: 16, color: CupertinoColors.black),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 0.6,
              ),
            ),
          ),
          responsive.setSizeBox(height: 1),
        ],
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            context
                .read<CategoryCubit>()
                .fetchUpdateTitleCategories(category.sId);
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Cancel"),
      ),
    ),
  );
}

Widget _buildCategoryCard(
  CategoryResponseData category,
  BuildContext context,
  ResponsiveUtils responsive,
) {
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
              imageUrl: category.image!,
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
          category.title!,
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
          baseColor: AppInitialRoute.role == "admin"
              ? category.active == true
                  ? Colors.green.shade600
                  : Colors.red.shade600
              : null,
          highlightColor: AppInitialRoute.role == "admin"
              ? category.active == true
                  ? Colors.green.shade200
                  : Colors.red.shade200
              : null,
        ),
      ],
    ),
  );
}
