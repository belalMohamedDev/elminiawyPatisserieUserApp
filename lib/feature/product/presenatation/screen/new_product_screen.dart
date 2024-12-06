import '../../../../core/common/shared/shared_imports.dart'; //

class NewProductView extends StatelessWidget {
  const NewProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.translate(AppStrings.newProductsInStore),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 16.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        child: Column(
      children: [
        const SearchRow(),
        SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is GetNewProductLoading || state is GetNewProductError) {
                return const ProductGridViewLoadingState();
              }

              return ProductGridViewSuccessState(
                dataList: context.read<ProductCubit>().dataList,
                grideViewIndex: 16,
              );
            },
          ),
        ),
      ],
    ),
      ),
    );
  }
}
