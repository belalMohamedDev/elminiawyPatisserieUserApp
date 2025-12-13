import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/home/presentation/widget/get_admin_orders_data_body_view.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({super.key});

  @override
  State<PendingOrders> createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  @override
  void initState() {
    context.read<AdminHomeCubit>().getAdminOrdersSummit(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text(
                  context.translate(AppStrings.pendingOrders),
                  style: TextStyle(fontSize: 17),
                ),
              ),
              body: GetAdminOrdersDataBodyView(state, isPendingOrder: true),
            ),
            LoadingOverlay(isLoading: state is UpdateAdminOrderStatusLoading),
          ],
        );
      },
    );
  }
}
