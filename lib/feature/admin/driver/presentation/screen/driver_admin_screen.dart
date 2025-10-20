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
      await Future.wait([
        context.read<DriverCubit>().fetchGetAllDriver(),
      ]);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<DriverCubit, DriverState>(
      builder: (context, state) {
        final driver = context.read<DriverCubit>().allDriver;
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
              body: Column(
                children: [
                  Container(
                    padding: responsive.setPadding(top: 2, bottom: 2),
                    margin: responsive.setMargin(
                        left: 5, right: 5, top: 1, bottom: 2),
                    height: responsive.setHeight(15),
                    width: responsive.screenWidth,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius:
                          BorderRadius.circular(responsive.setBorderRadius(3)),
                      color: ColorManger.backgroundItem,
                    ),
                    child: Column(
                      children: [
                        Text("Total Drivers",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: responsive.setTextSize(4),
                                    color: ColorManger.brun)),
                        Text(
                            "${state is GetAllDriverSuccess ? state.data.total! : "0"}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: responsive.setTextSize(8),
                                    color: ColorManger.brun)),
                        Text("Sotive Drivers",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: responsive.setTextSize(3.5),
                                    color: ColorManger.brunLight)),
                      ],
                    ),
                  ),
                  // SizedBox(height: responsive.setHeight(2)),
                  Container(
                    margin: responsive.setMargin(left: 5, right: 5, bottom: 1),
                    height: responsive.setHeight(10),
                    width: responsive.screenWidth,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius:
                          BorderRadius.circular(responsive.setBorderRadius(3)),
                      color: ColorManger.backgroundItem,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Active Drivers",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: responsive.setTextSize(4),
                                        color: ColorManger.brun)),
                            Text(
                                "${state is GetAllDriverSuccess ? state.data.active! : "0"}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: responsive.setTextSize(6),
                                        color: ColorManger.brun)),
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
                            Text("Inactive Drivers",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: responsive.setTextSize(4),
                                        color: ColorManger.brun)),
                            Text(
                                "${state is GetAllDriverSuccess ? state.data.inactive! : "0"}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: responsive.setTextSize(6),
                                        color: ColorManger.brun)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: responsive.setHeight(1)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: driver.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: responsive.setMargin(
                              left: 5, right: 5, bottom: 1.5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(
                                responsive.setBorderRadius(3)),
                            color: ColorManger.backgroundItem,
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  responsive.setBorderRadius(3)),
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
                                  color: ColorManger.brun),
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
                                          color: ColorManger.brunLight),
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
                                          color: ColorManger.brunLight),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: GestureDetector(
                              child: Icon(IconlyBold.moreCircle,
                                  color: driver[index].driverActive == false &&
                                          driver[index].completeData == true
                                      ? Colors.red
                                      : driver[index].completeData == false
                                          ? Colors.yellow.shade800
                                          : Colors.green.shade800,
                                  size: responsive.setIconSize(6)),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),

              //_tabDriverBodyBar(context, state)
            ),
            LoadingOverlay(
                isLoading: state is DriverActivedLoading ||
                    state is DeleteDriverLoading)
          ],
        );
      },
    );
  }
}
