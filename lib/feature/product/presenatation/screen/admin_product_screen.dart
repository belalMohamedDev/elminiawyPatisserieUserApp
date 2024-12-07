import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/product/presenatation/widget/get_product_success_widget.dart';

class AdminProductScreen extends StatefulWidget {
  const AdminProductScreen({super.key});

  @override
  State<AdminProductScreen> createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchGetAllProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Scaffold(
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
            body: const GetProductSuccessWidget());
      },
    );
  }
}

