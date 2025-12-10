import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AdminsScreen extends StatefulWidget {
  const AdminsScreen({super.key});

  @override
  State<AdminsScreen> createState() => _AdminsScreenState();
}

class _AdminsScreenState extends State<AdminsScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<AdminsCubit>().fetchGetAllAdmins();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<AdminsCubit, AdminsState>(
      builder: (context, state) {
        final admins = context.read<AdminsCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              context.translate(AppStrings.admins),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: responsive.setTextSize(4),
              ),
            ),

            actions: [
              (state is GetActiveAdminsLoading)
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.addNewAdmin);
                      },
                      child: Container(
                        height: responsive.setHeight(4),
                        width: responsive.setWidth(8.5),
                        decoration: BoxDecoration(
                          color: ColorManger.brun,
                          borderRadius: BorderRadius.circular(
                            responsive.setBorderRadius(5),
                          ),
                        ),
                        child: Icon(Icons.add, color: ColorManger.white),
                      ),
                    ),
              SizedBox(width: responsive.setWidth(6)),
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: responsive.setPadding(top: 2, bottom: 2),
                margin: responsive.setMargin(
                  left: 5,
                  right: 5,
                  top: 1,
                  bottom: 2,
                ),
                height: responsive.setHeight(15),
                width: responsive.screenWidth,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(
                    responsive.setBorderRadius(3),
                  ),
                  color: ColorManger.backgroundItem,
                ),
                child: Column(
                  children: [
                    Text(
                      "Total Admins",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: responsive.setTextSize(4),
                        color: ColorManger.brun,
                      ),
                    ),
                    Text(
                      "${admins.totalAdmins}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: responsive.setTextSize(8),
                        color: ColorManger.brun,
                      ),
                    ),
                    Text(
                      "Sotive Admins",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: responsive.setTextSize(3.5),
                        color: ColorManger.brunLight,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: responsive.setMargin(left: 5, right: 5, bottom: 1),
                height: responsive.setHeight(10),
                width: responsive.screenWidth,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(
                    responsive.setBorderRadius(3),
                  ),
                  color: ColorManger.backgroundItem,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Active Admins",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontSize: responsive.setTextSize(4),
                                color: ColorManger.brun,
                              ),
                        ),
                        Text(
                          "${admins.totalActiveAdmins}",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontSize: responsive.setTextSize(6),
                                color: ColorManger.brun,
                              ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: responsive.setHeight(6),
                      color: ColorManger.brownLight,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Inactive Admins",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontSize: responsive.setTextSize(4),
                                color: ColorManger.brun,
                              ),
                        ),
                        Text(
                          "${admins.totalInactiveAdmins}",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontSize: responsive.setTextSize(6),
                                color: ColorManger.brun,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsive.setHeight(1)),
              if (state is GetActiveAdminsSuccess)
                _getAllAdminDataSuccess(admins.allActiveAdmins, responsive),
              if (state is GetActiveAdminsLoading)
                _getAllAdminDataLoading(responsive),
            ],
          ),
        );
      },
    );
  }

  Expanded _getAllAdminDataSuccess(
    List<DataAuthResponse> admins,
    ResponsiveUtils responsive,
  ) {
    return Expanded(
      child: ListView.builder(
        itemCount: admins.length,
        itemBuilder: (context, index) {
          return Container(
            margin: responsive.setMargin(left: 5, right: 5, bottom: 1.5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(
                responsive.setBorderRadius(3),
              ),
              color: ColorManger.backgroundItem,
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(
                  responsive.setBorderRadius(3),
                ),
                child: CachedNetworkImage(
                  imageUrl: admins[index].image ?? "",
                  width: responsive.setWidth(15),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => LoadingShimmer(
                    height: responsive.setHeight(12),
                    width: responsive.setWidth(12),
                    borderRadius: responsive.setBorderRadius(2),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(ImageAsset.driverPerson),
                ),
              ),
              title: Text(
                admins[index].name ?? "",
                style: TextStyle(
                  fontSize: responsive.setTextSize(3.5),
                  fontWeight: FontWeight.bold,
                  color: ColorManger.brun,
                ),
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        IconlyBold.call,
                        color: ColorManger.brunLight,
                        size: responsive.setTextSize(3.8),
                      ),
                      SizedBox(width: responsive.setWidth(2)),
                      Text(
                        admins[index].phone ?? "",
                        style: TextStyle(
                          fontSize: responsive.setTextSize(3.2),
                          color: ColorManger.brunLight,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        IconlyBold.message,
                        color: ColorManger.brunLight,
                        size: responsive.setTextSize(3.8),
                      ),
                      SizedBox(width: responsive.setWidth(2)),
                      Text(
                        admins[index].email ?? "",
                        style: TextStyle(
                          fontSize: responsive.setTextSize(3.2),
                          color: ColorManger.brunLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: GestureDetector(
                child: Icon(
                  IconlyBold.moreCircle,
                  color:
                      admins[index].active == false &&
                          admins[index].completeData == true
                      ? Colors.red
                      : admins[index].completeData == false ||
                            admins[index].completeData == null
                      ? Colors.yellow.shade800
                      : Colors.green.shade800,
                  size: responsive.setIconSize(6),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Expanded _getAllAdminDataLoading(ResponsiveUtils responsive) {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: responsive.setMargin(left: 5, right: 5, bottom: 1.5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(
                responsive.setBorderRadius(3),
              ),
              color: ColorManger.backgroundItem,
            ),
            child: ListTile(
              leading: LoadingShimmer(
                width: responsive.setWidth(15),
                borderRadius: 12.r,
              ),
              title: LoadingShimmer(
                height: responsive.setHeight(0.8),
                borderRadius: 12.r,
              ),
              subtitle: Column(
                children: [
                  responsive.setSizeBox(height: 1),
                  Row(
                    children: [
                      LoadingShimmer(
                        height: responsive.setHeight(0.8),
                        borderRadius: 12.r,
                      ),
                      SizedBox(width: responsive.setWidth(2)),
                      LoadingShimmer(
                        height: responsive.setHeight(0.8),
                        width: responsive.setWidth(40),
                        borderRadius: 12.r,
                      ),
                    ],
                  ),
                  responsive.setSizeBox(height: 0.5),
                  Row(
                    children: [
                      LoadingShimmer(
                        height: responsive.setHeight(0.8),
                        borderRadius: 12.r,
                      ),
                      SizedBox(width: responsive.setWidth(2)),
                      LoadingShimmer(
                        height: responsive.setHeight(0.8),
                        width: responsive.setWidth(40),
                        borderRadius: 12.r,
                      ),
                    ],
                  ),
                ],
              ),
              trailing: LoadingShimmer(
                height: responsive.setHeight(2.5),
                width: responsive.setWidth(5),
                borderRadius: 50.r,
                highlightColor: Colors.green,
                baseColor: Colors.green.shade700,
              ),
            ),
          );
        },
      ),
    );
  }

  // Column _tabAdminsBodyBar(BuildContext context, AdminsState state) {
  //   final responsive = ResponsiveUtils(context);
  //   return Column(
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           color: Colors.grey[100],
  //         ),
  //         child: TabBar(
  //           controller: _tabController,
  //           tabs: [
  //             Tab(
  //               text: context.translate(AppStrings.activeAdmins),
  //             ),
  //             Tab(text: context.translate(AppStrings.notActiveAdmins)),
  //           ],
  //           labelColor: ColorManger.brun, // Text color of selected tab
  //           unselectedLabelColor: ColorManger.brun,
  //           unselectedLabelStyle: Theme.of(context)
  //               .textTheme
  //               .titleLarge!
  //               .copyWith(fontSize: responsive.setTextSize(4)),
  //           labelStyle: Theme.of(context)
  //               .textTheme
  //               .titleLarge!
  //               .copyWith(fontSize: responsive.setTextSize(4)),

  //           indicatorSize: TabBarIndicatorSize.tab,
  //           dividerColor: Colors.transparent,
  //           indicator: BoxDecoration(
  //             color: Colors.grey[300],
  //           ), // Remove default indicator
  //         ),
  //       ),
  //       Expanded(
  //         child: TabBarView(
  //           controller: _tabController,
  //           children: [
  //             AdminTable(state: state),
  //             AdminTable(
  //               state: state,
  //               isActive: false,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
