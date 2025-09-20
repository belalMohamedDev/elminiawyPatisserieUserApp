import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AdminsScreen extends StatefulWidget {
  const AdminsScreen({super.key});

  @override
  State<AdminsScreen> createState() => _AdminsScreenState();
}

class _AdminsScreenState extends State<AdminsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context.read<AdminsCubit>().fetchGetAllActiveAdmins(),
        context.read<AdminsCubit>().fetchGetAllInActiveAdmins(),
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

    return BlocBuilder<AdminsCubit, AdminsState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                context.translate(AppStrings.admins),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: responsive.setTextSize(4)),
              ),
            ),
            body: _tabAdminsBodyBar(context, state));
      },
    );
  }

  Column _tabAdminsBodyBar(BuildContext context, AdminsState state) {
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
                text: context.translate(AppStrings.activeAdmins),
              ),
              Tab(text: context.translate(AppStrings.notActiveAdmins)),
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
              AdminTable(state: state),
              AdminTable(
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

