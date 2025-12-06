import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/product/logic/adminProduct/admin_product_cubit.dart';
import 'package:elminiawy/feature/product/presenatation/screen/add_product.dart';

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
      context.read<AdminProductCubit>().fetchGetAllProduct();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<AdminProductCubit, AdminProductState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  context.translate(AppStrings.products),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: responsive.setTextSize(4),
                  ),
                ),
              ),
              floatingActionButton: (state is GetAllProductLoading)
                  ? const SizedBox()
                  : FloatingActionButton(
                      backgroundColor: ColorManger.brun,
                      onPressed: () {
                        // showCreateAndEditImageBannerDialog(
                        //     context, null, context.read<BannerCubit>());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) =>
                                      instance<AdminProductCubit>(),
                                ),
                                BlocProvider(
                                  create: (context) =>
                                      instance<SubCategoriesCubit>(),
                                ),
                              ],
                              child: AddProductScreen(),
                            ),
                          ),
                        );

                        // showProductEditPopup(
                        //   null,
                        //   context,
                        // );
                      },
                      child: Icon(Icons.add, color: ColorManger.white),
                    ),
              body: state is GetAllProductLoading
                  ? const GetProductLoadingWidget()
                  : NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollUpdateNotification &&
                            !isLoadingMore &&
                            state is! SubCategoriesLoadingFromPagination &&
                            context.read<AdminProductCubit>().theLastPage !=
                                context.read<AdminProductCubit>().page) {
                          final currentScroll = notification.metrics.pixels;
                          final maxScroll =
                              notification.metrics.maxScrollExtent;
                          const prefetchThreshold = 1200;

                          if (currentScroll >= maxScroll - prefetchThreshold &&
                              !isLoadingMore) {
                            isLoadingMore = true;

                            context
                                .read<AdminProductCubit>()
                                .fetchGetAllProduct(fromPagination: true)
                                .whenComplete(() => isLoadingMore = false);
                          }
                        }
                        return false;
                      },
                      child: GetProductSuccessWidget(state: state),
                    ),
            ),
            LoadingOverlay(isLoading: state is UpdateProductLoading),
          ],
        );
      },
    );
  }
}
