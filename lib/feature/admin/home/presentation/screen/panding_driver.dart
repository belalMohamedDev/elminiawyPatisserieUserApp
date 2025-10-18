import 'package:elminiawy/core/common/shared/shared_imports.dart';

import '../widget/get_admin_orders_data_body_view.dart';

class PendingDriver extends StatefulWidget {
  const PendingDriver({super.key});

  @override
  State<PendingDriver> createState() => _PendingDriverState();
}

class _PendingDriverState extends State<PendingDriver> {
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
                  "Pending Driver",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )),
                body: GetAdminOrdersDataBodyView(
                  state,
                  isPendingDriver: true,
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
