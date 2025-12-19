import 'package:elminiawy/core/common/shared/shared_imports.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate(AppStrings.coupons)),
      ),
      body: Center(
        child: Text('Coupons Screen Content Here'),
      ),
    );
  }
}