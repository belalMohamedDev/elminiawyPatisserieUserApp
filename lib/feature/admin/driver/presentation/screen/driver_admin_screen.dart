import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/driver/presentation/widget/all_driver_not_active_table.dart';

class AdminDriversScreen extends StatefulWidget {
  const AdminDriversScreen({super.key});

  @override
  State<AdminDriversScreen> createState() => _AdminDriversScreenState();
}

class _AdminDriversScreenState extends State<AdminDriversScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    context.read<DriverCubit>().fetchGetAllNotActiveDriver();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
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
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: ColorManger.white,
              ),
            ),
            body: _tabDriverBodyBar(context, state));
      },
    );
  }

  Column _tabDriverBodyBar(BuildContext context, DriverState state) {
    final responsive = ResponsiveUtils(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: context.translate(AppStrings.allActiveDriver),
              ),
              Tab(text: context.translate(AppStrings.allNotActiveDriver)),
            ],
            labelColor: ColorManger.brun, // Text color of selected tab
            unselectedLabelColor: ColorManger.brun,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: responsive.setTextSize(4)),
            labelStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: responsive.setTextSize(4)),

            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: Colors.grey[300],
            ), // Remove default indicator
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              AllDriverNotActiveTable(state: state),
            ],
          ),
        ),
      ],
    );
  }
}
