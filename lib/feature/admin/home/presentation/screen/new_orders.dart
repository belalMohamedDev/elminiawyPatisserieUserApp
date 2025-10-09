import '../../../../../core/common/shared/shared_imports.dart';
import '../widget/get_admin_orders_data_body_view.dart';

class NewOrders extends StatefulWidget {
  const NewOrders({super.key});

  @override
  State<NewOrders> createState() => _NewOrdersState();
}

class _NewOrdersState extends State<NewOrders> {
  @override
  void initState() {
    context.read<AdminHomeCubit>().getAdminOrdersSummit(0);
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
                  "New Orders Today",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )),
                body: BlocBuilder<AdminHomeCubit, AdminHomeState>(
                  builder: (context, state) {
                    return GetAdminOrdersDataBodyView(state);
                  },
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
