import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AdminDriversScreen extends StatefulWidget {
  const AdminDriversScreen({super.key});

  @override
  State<AdminDriversScreen> createState() => _AdminDriversScreenState();
}

class _AdminDriversScreenState extends State<AdminDriversScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await Future.wait([context.read<DriverCubit>().fetchGetAllDriver()]);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<DriverCubit, DriverState>(
      builder: (context, state) {
        final driver = context.read<DriverCubit>();
        return Stack(
          children: [
            Scaffold(
              appBar: _driverAppBar(context, responsive, state),

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
                          context.translate(AppStrings.totalDrivers),
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontSize: responsive.setTextSize(4),
                                color: ColorManger.brun,
                              ),
                        ),
                        Text(
                          "${driver.totalDriver}",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontSize: responsive.setTextSize(8),
                                color: ColorManger.brun,
                              ),
                        ),
                        Text(
                          context.translate(AppStrings.storeDrivers),
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
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
                          offset: const Offset(
                            0,
                            3,
                          ), // changes position of shadow
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
                              context.translate(AppStrings.allActiveDriver),
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    fontSize: responsive.setTextSize(4),
                                    color: ColorManger.brun,
                                  ),
                            ),
                            Text(
                              "${driver.totalActiveDriver}",
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
                              context.translate(AppStrings.allNotActiveDriver),
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    fontSize: responsive.setTextSize(4),
                                    color: ColorManger.brun,
                                  ),
                            ),
                            Text(
                              "${driver.totalInactiveDriver}",
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

                  driver.allDriver.isEmpty || state is GetAllDriverLoading
                      ? _getAllDriverDataLoading(responsive)
                      : _getAllDriverDataSuccess(driver.allDriver, responsive),
                ],
              ),
            ),
            LoadingOverlay(isLoading: state is CreateNewDriverLoading),
          ],
        );
      },
    );
  }

  AppBar _driverAppBar(
    BuildContext context,
    ResponsiveUtils responsive,
    DriverState state,
  ) {
    return AppBar(
      centerTitle: true,
      title: Text(
        context.translate(AppStrings.driver),
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(fontSize: responsive.setTextSize(4)),
      ),

      actions: [
        (state is GetActiveAdminsLoading)
            ? const SizedBox()
            : GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.addNewDriver);
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
    );
  }

  Expanded _getAllDriverDataSuccess(
    List<DataAuthResponse> driver,
    ResponsiveUtils responsive,
  ) {
    return Expanded(
      child: ListView.builder(
        itemCount: driver.length,
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
                  imageUrl: driver[index].image ?? "",
                  // height: responsive.setHeight(10),
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
                driver[index].name ?? "",
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
                        driver[index].phone ?? "",
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
                        driver[index].email ?? "",
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
                onTap: () {
                  context.read<DriverCubit>().fetchDeleteDriver(
                    id: driver[index].sId!,
                  );
                },
                child: Icon(
                  IconlyBold.delete,
                  color:
                      driver[index].driverActive == false &&
                          driver[index].completeData == true
                      ? Colors.red
                      : driver[index].completeData == false
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

  Expanded _getAllDriverDataLoading(ResponsiveUtils responsive) {
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
}
