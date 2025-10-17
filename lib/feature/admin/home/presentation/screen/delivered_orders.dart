import 'package:elminiawy/core/common/shared/shared_imports.dart';

import '../widget/get_admin_orders_data_body_view.dart';

class DeliverdOrders extends StatefulWidget {
  const DeliverdOrders({super.key});

  @override
  State<DeliverdOrders> createState() => _DeliverdOrdersState();
}

class _DeliverdOrdersState extends State<DeliverdOrders> {
  @override
  void initState() {
    context.read<AdminHomeCubit>().getAdminOrdersSummit(2);

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
                    title: const Text(
                  "Deliverd Orders",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )),
                body: GetAdminOrdersDataBodyView(
                  state,
                  isDeliveredOrder: true,
                )),
            LoadingOverlay(
              isLoading: state is UpdateAdminOrderStatusLoading,
            ),
          ],
        );
      },
    );
  }
}
