import 'package:elminiawy/core/common/shared/shared_imports.dart';

import '../widget/get_admin_orders_data_loading_view.dart';
import '../widget/get_admin_orders_data_success_view.dart';

class CompleteOrdersView extends StatefulWidget {
  const CompleteOrdersView({super.key});

  @override
  State<CompleteOrdersView> createState() => _CompleteOrdersViewState();
}

class _CompleteOrdersViewState extends State<CompleteOrdersView> {
  @override
  void initState() {
    context.read<AdminHomeCubit>().getAdminOrdersCompletedSummit();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Text(
            "Complete  Orders",
            style: TextStyle(
              fontSize: 17,
            ),

          )
      ),


      body: BlocBuilder<AdminHomeCubit, AdminHomeState>(
        builder: (context, state) {
          return state is GetCompletedAdminOrdersSuccess
              ? const GetAdminOrdersDataSuccessView(isCompleteOrder: true,)
              : const GetAdminOrdersDataLoadingView(isCompleteOrder: true,);
        },
      )


    );
  }
}
