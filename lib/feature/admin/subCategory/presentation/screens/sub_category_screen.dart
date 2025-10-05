import 'package:elminiawy/core/common/shared/shared_imports.dart';

import '../widget/get_sub_category_loading.dart';

class AdminSubCategoryScreen extends StatefulWidget {
  const AdminSubCategoryScreen({super.key});

  @override
  State<AdminSubCategoryScreen> createState() => _AdminSubCategoryScreenState();
}

class _AdminSubCategoryScreenState extends State<AdminSubCategoryScreen> {
  bool isLoadingMore = false;
  @override
  void initState() {
    super.initState();
    Future.wait([
      context.read<SubCategoriesCubit>().fetchGetSubCategories(),
      context.read<CategoryCubit>().getCategories(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFfcf8f5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFfcf8f5),
        centerTitle: true,
        title: Text(
          context.translate(AppStrings.subCategory),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: responsive.setTextSize(4)),
        ),
      ),
      floatingActionButton: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
        builder: (context, state) {
          return state is GetSubCategoriesLoading ||
                  state is GetSubCategoriesError
              ? const SizedBox()
              : FloatingActionButton(
                  backgroundColor: ColorManger.brown,
                  onPressed: () {
                    showEditAndCreateSubCategoryDialog(
                        context,
                        null,
                        context.read<SubCategoriesCubit>(),
                        context.read<CategoryCubit>());
                  },
                  child: Icon(
                    Icons.add,
                    color: ColorManger.white,
                  ),
                );
        },
      ),
      body: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
        builder: (context, state) {
          final subCategories =
              context.read<SubCategoriesCubit>().subCategories;
          return RefreshIndicator(
            backgroundColor: ColorManger.white,
            color: ColorManger.brun,
            onRefresh: () {
              return context.read<SubCategoriesCubit>().fetchGetSubCategories();
            },
            child: Stack(
              children: [
                NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollUpdateNotification &&
                        !isLoadingMore &&
                        state is! SubCategoriesLoadingFromPagination &&
                        context.read<SubCategoriesCubit>().theLastPage !=
                            context.read<SubCategoriesCubit>().page) {
                      final currentScroll = notification.metrics.pixels;
                      final maxScroll = notification.metrics.maxScrollExtent;
                      const prefetchThreshold = 1200;

                      if (currentScroll >= maxScroll - prefetchThreshold &&
                          !isLoadingMore) {
                        isLoadingMore = true;

                        context
                            .read<SubCategoriesCubit>()
                            .fetchGetSubCategories(fromPagination: true)
                            .whenComplete(() => isLoadingMore = false);
                      }
                    }
                    return false;
                  },
                  child: GetSubCategoryDataSuccess(
                      subCategories: subCategories, state: state),
                ),
                if (state is GetSubCategoriesLoading ||
                    state is GetSubCategoriesError)
                  const GetSubCategoryDataLoading(),
                LoadingOverlay(
                    isLoading: state is CreateSubCategoriesLoading ||
                        state is UpdateSubCategoriesLoading ||
                        state is DeleteSubCategoriesLoading),
              ],
            ),
          );
        },
      ),
    );
  }
}
