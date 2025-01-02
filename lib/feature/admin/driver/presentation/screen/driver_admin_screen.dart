import 'package:elminiawy/core/common/shared/shared_imports.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context.read<DriverCubit>().fetchGetAllActiveDriver(),
        context.read<DriverCubit>().fetchGetAllNotActiveDriver(),
      ]);
    });

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
        return Stack(
          children: [
            Scaffold(
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
                body: _tabDriverBodyBar(context, state)),
            LoadingOverlay(isLoading: state is DriverActivedLoading)
          ],
        );
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
              DriverTable(state: state),
              DriverTable(
                state: state,
                isActive: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
