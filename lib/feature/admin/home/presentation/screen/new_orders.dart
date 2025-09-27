import '../../../../../core/common/shared/shared_imports.dart';
import '../widget/get_admin_orders_data_loading_view.dart';
import '../widget/get_admin_orders_data_success_view.dart';

class NewOrders extends StatefulWidget {
  const NewOrders({super.key});

  @override
  State<NewOrders> createState() => _NewOrdersState();
}

class _NewOrdersState extends State<NewOrders> {
  @override
  void initState() {
    context.read<AdminHomeCubit>().getAdminOrdersPendingSummit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "New Orders Today",
          style: TextStyle(
            fontSize: 17,
          ),
        )),
        body: BlocBuilder<AdminHomeCubit, AdminHomeState>(
          builder: (context, state) {
            return state is GetPendingAdminOrdersSuccess
                ? const GetAdminOrdersDataSuccessView()
                : const GetAdminOrdersDataLoadingView();
          },
        ));
  }
}
