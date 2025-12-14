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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
          builder: (context, state) {
            return AppBar(
              actions: [
                (state is GetSubCategoriesLoading ||
                        state is GetSubCategoriesError)
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.addSubCategoryScreen);
                        },
                        child: Container(
                          height: responsive.setHeight(4),
                          width: responsive.setWidth(8.5),
                          decoration: BoxDecoration(
                            color: ColorManger.brown,
                            borderRadius: BorderRadius.circular(
                              responsive.setBorderRadius(5),
                            ),
                          ),
                          child: Icon(Icons.add, color: ColorManger.white),
                        ),
                      ),
                SizedBox(width: responsive.setWidth(6)),
              ],
              backgroundColor: const Color(0xFFfcf8f5),
              centerTitle: true,
              title: Text(
                context.translate(AppStrings.subCategory),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: responsive.setTextSize(4),
                ),
              ),
            );
          },
        ),
      ),

      body: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
        builder: (context, state) {
          final subCategories = context
              .read<SubCategoriesCubit>()
              .subCategories;
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
                    subCategories: subCategories,
                    state: state,
                  ),
                ),
                if (state is GetSubCategoriesLoading ||
                    state is GetSubCategoriesError)
                  const GetSubCategoryDataLoading(),
                LoadingOverlay(
                  isLoading:
                      state is CreateSubCategoriesLoading ||
                      state is UpdateSubCategoriesLoading ||
                      state is UpdateSubCategoriesImageLoading ||
                      state is DeleteSubCategoriesLoading,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
