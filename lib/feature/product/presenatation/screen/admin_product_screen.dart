import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AdminProductScreen extends StatefulWidget {
  const AdminProductScreen({super.key});

  @override
  State<AdminProductScreen> createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  bool isLoadingMore = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        context.read<ProductCubit>().fetchGetAllProduct(),
        context
            .read<SubCategoriesCubit>()
            .fetchGetSubCategories(disablePagination: true)
      ]);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    context.translate(AppStrings.products),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: responsive.setTextSize(4)),
                  ),
                ),
                floatingActionButton: (state is GetAllProductLoading)
                    ? const SizedBox()
                    : FloatingActionButton(
                        backgroundColor: ColorManger.brun,
                        onPressed: () {
                          // showCreateAndEditImageBannerDialog(
                          //     context, null, context.read<BannerCubit>());

                          showProductEditPopup(
                            null,
                            context,
                          );
                        },
                        child: Icon(
                          Icons.add,
                          color: ColorManger.white,
                        ),
                      ),
                body: state is GetAllProductLoading
                    ? const GetProductLoadingWidget()
                    : NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollUpdateNotification &&
                              !isLoadingMore &&
                              state is! SubCategoriesLoadingFromPagination &&
                              context.read<ProductCubit>().theLastPage !=
                                  context.read<ProductCubit>().page) {
                            final currentScroll = notification.metrics.pixels;
                            final maxScroll =
                                notification.metrics.maxScrollExtent;
                            const prefetchThreshold = 1200;

                            if (currentScroll >=
                                    maxScroll - prefetchThreshold &&
                                !isLoadingMore) {
                              isLoadingMore = true;

                              context
                                  .read<ProductCubit>()
                                  .fetchGetAllProduct(fromPagination: true)
                                  .whenComplete(() => isLoadingMore = false);
                            }
                          }
                          return false;
                        },
                        child: GetProductSuccessWidget(state: state))),
            LoadingOverlay(isLoading: state is UpdateProductLoading)
          ],
        );
      },
    );
  }
}
