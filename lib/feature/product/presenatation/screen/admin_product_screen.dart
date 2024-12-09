import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AdminProductScreen extends StatefulWidget {
  const AdminProductScreen({super.key});

  @override
  State<AdminProductScreen> createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchGetAllProduct();
    context.read<SubCategoriesCubit>().fetchGetSubCategories();

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
                          showCreateAndEditImageBannerDialog(
                              context, null, context.read<BannerCubit>());
                        },
                        child: Icon(
                          Icons.add,
                          color: ColorManger.white,
                        ),
                      ),
                body: state is GetAllProductLoading
                    ? const GetProductLoadingWidget()
                    : GetProductSuccessWidget(state: state)),
            LoadingOverlay(isLoading: state is UpdateProductLoading)
          ],
        );
      },
    );
  }
}
