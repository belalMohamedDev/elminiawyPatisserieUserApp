import '../../../../../../core/common/shared/shared_imports.dart';
import '../widget/view_basket_cart_widget.dart';

class ProductBaseOnCategory extends StatefulWidget {
  const ProductBaseOnCategory({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;

  @override
  State<ProductBaseOnCategory> createState() => _ProductBaseOnCategoryState();
}

class _ProductBaseOnCategoryState extends State<ProductBaseOnCategory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await Future.wait([
        context.read<ProductBasedOnCategoryCubit>().getProductBasedOnCategory(
          widget.categoryId,
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: 16.sp),
        ),
      ),
      body: Stack(
        children: [
          const ProductBaseOnCategoryBody(),
          AppInitialRoute.role == "admin"
              ? const ViewBasketCartWidget()
              : const SizedBox(),
        ],
      ),
    );
  }
}
