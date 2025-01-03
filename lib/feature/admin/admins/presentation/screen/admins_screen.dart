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

class AdminTable extends StatelessWidget {
  const AdminTable({
    super.key,
    required this.state,
    this.isActive = true,
  });

  final AdminsState state;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    List<DataAuthResponse> data = isActive
        ? context.read<AdminsCubit>().allActiveAdmins
        : context.read<AdminsCubit>().allInActiveAdmins;
    return Column(
      children: [
        DataTable(
          showCheckboxColumn: false,
          columnSpacing: responsive.setWidth(0),
          horizontalMargin: responsive.setWidth(5),
          headingRowColor: WidgetStateProperty.all(Colors.grey[100]),
          border: TableBorder(
            bottom: BorderSide(color: Colors.grey[400]!, width: 1),
            top: BorderSide(color: Colors.grey[400]!, width: 0.5),
          ),
          columns: [
            DataColumn(
              label: responsive.setSizeBox(
                width: 39,
                child: Text(
                  context.translate(AppStrings.driverName),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: responsive.setTextSize(3),
                      ),
                ),
              ),
            ),
            DataColumn(
              label: responsive.setSizeBox(
                width: 22,
                child: Text(
                  context.translate(AppStrings.phoneNumber),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: responsive.setTextSize(3),
                      ),
                ),
              ),
            ),
            DataColumn(
              label: responsive.setSizeBox(
                width: 31,
                child: Center(
                  child: Text(
                    context.translate(AppStrings.email),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: responsive.setTextSize(3),
                        ),
                  ),
                ),
              ), // Icon column for Active/Inactive action
            ),
          ],
          rows: [
            ...data.map((item) {
              return DataRow(
                onSelectChanged: (_) {
               //   showeDriverEditActionDialog(context, item, isActive);
                },
                cells: [
                  DataCell(
                    responsive.setSizeBox(
                      width: 39,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        item.name!,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: responsive.setTextSize(2.8),
                            ),
                      ),
                    ),
                  ),
                  DataCell(
                    responsive.setSizeBox(
                        width: 20,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          item.phone!,
                          style: TextStyle(
                            color: ColorManger.brun,
                            fontSize: responsive.setTextSize(2.8),
                            fontFamily: FontConsistent.geLocalozedFontFamily(),
                          ),
                        )),
                  ),
                  DataCell(
                    responsive.setSizeBox(
                        width: 31,
                        child: Text(
                          item.email!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: ColorManger.brun,
                            fontSize: responsive.setTextSize(2.8),
                            fontFamily: FontConsistent.geLocalozedFontFamily(),
                          ),
                        )),
                  ),
                ],
              );
            }),
          ],
        ),
        responsive.setSizeBox(height: 3),
        if (state is GetAllNotActiveDriverLoading ||
            state is GetAllNotActiveDriverError)
          CircularProgressIndicator(
            color: ColorManger.brun,
          ),
      ],
    );
  }
}
