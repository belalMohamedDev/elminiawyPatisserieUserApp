import 'package:elminiawy/feature/admin/home/presentation/widget/get_admin_orders_data_body_view.dart';

import '../../../../../core/common/shared/shared_imports.dart';

class DeferredPaymentScreen extends StatefulWidget {
  const DeferredPaymentScreen({super.key});

  @override
  State<DeferredPaymentScreen> createState() => _DeferredPaymentScreenState();
}

class _DeferredPaymentScreenState extends State<DeferredPaymentScreen> {
  @override
  void initState() {
    context.read<AdminHomeCubit>().getAdminOrdersSummit(
      status: 4,
      paymentStatus: "partially_paid",
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(AppStrings.deferredPayment),
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: BlocBuilder<AdminHomeCubit, AdminHomeState>(
        builder: (context, state) {
          return GetAdminOrdersDataBodyView(state, isCompleteOrder: true);
        },
      ),
    );
  }
}
