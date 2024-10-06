
import '../../../../../core/common/shared/shared_imports.dart'; //

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.myOrders,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
           
                fontSize: 16.sp)),
      ),
      body: const MyOrdersBody(),
    );
  }
}
