import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/driver/presentation/widget/all_driver_not_active_table.dart';

class AdminDriversScreen extends StatefulWidget {
  const AdminDriversScreen({super.key});

  @override
  State<AdminDriversScreen> createState() => _AdminDriversScreenState();
}

class _AdminDriversScreenState extends State<AdminDriversScreen> {
  @override
  void initState() {
    context.read<DriverCubit>().fetchGetAllNotActiveDriver();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return BlocBuilder<DriverCubit, DriverState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                context.translate(AppStrings.driver),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: responsive.setTextSize(4)),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorManger.brun,
              onPressed: () { },
              child: Icon(
                Icons.add,
                color: ColorManger.white,
              ),
            ),
            body: Column(
              children: [
                AllDriverNotActiveTable(state: state),
                responsive.setSizeBox(height: 3),
                if (state is GetAllNotActiveDriverLoading ||
                    state is GetAllNotActiveDriverError)
                  CircularProgressIndicator(
                    color: ColorManger.brun,
                  ),
              ],
            ));
      },
    );
  }
}
