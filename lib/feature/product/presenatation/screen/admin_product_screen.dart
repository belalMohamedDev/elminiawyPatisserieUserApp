import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/product/logic/adminProduct/admin_product_cubit.dart';

class AdminProductScreen extends StatefulWidget {
  const AdminProductScreen({super.key});

  @override
  State<AdminProductScreen> createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  bool isLoadingMore = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      context.read<AdminProductCubit>().fetchGetAllProduct();
      context.read<SubCategoriesCubit>().fetchGetSubCategories(
        disablePagination: true,
      );
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
              appBar: _adminProductAppBar(context, responsive, state),

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

  AppBar _adminProductAppBar(
    BuildContext context,
    ResponsiveUtils responsive,
    AdminProductState state,
  ) {
    return AppBar(
      centerTitle: true,
      title: Text(
        context.translate(AppStrings.products),
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(fontSize: responsive.setTextSize(4)),
      ),

      actions: [
        (state is GetAllProductLoading)
            ? const SizedBox()
            : GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.addProduct);
                },
                child: Container(
                  height: responsive.setHeight(4.5),
                  width: responsive.setWidth(9.5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(
                      responsive.setBorderRadius(5),
                    ),
                  ),
                  child: Icon(Icons.add, color: ColorManger.white),
                ),
              ),
        SizedBox(width: responsive.setWidth(5)),
      ],
    );
  }
}
