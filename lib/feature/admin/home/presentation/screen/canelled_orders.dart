import 'package:elminiawy/core/common/shared/shared_imports.dart';

import '../widget/get_admin_orders_data_loading_view.dart';
import '../widget/get_admin_orders_data_success_view.dart';

class CancelledOrders extends StatefulWidget {
  const CancelledOrders({super.key});

  @override
  State<CancelledOrders> createState() => _CancelledOrdersState();
}

class _CancelledOrdersState extends State<CancelledOrders> {
  @override
  void initState() {
    context.read<AdminHomeCubit>().getAdminOrdersSummit(5);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Cancelled Orders",
          style: TextStyle(
            fontSize: 17,
          ),
        )),
        body: BlocBuilder<AdminHomeCubit, AdminHomeState>(
          builder: (context, state) {
            return state is GetAdminOrdersSuccess
                ? const GetAdminOrdersDataSuccessView(
                    isCompleteOrder: true,
                  )
                : const GetAdminOrdersDataLoadingView(
                    isCompleteOrder: true,
                  );
          },
        ));
  }
}
