import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AssignDriver extends StatefulWidget {
  const AssignDriver({
    super.key,
    required this.orderModel,
  });

  final GetOrdersResponseData orderModel;

  @override
  State<AssignDriver> createState() => _AssignDriverState();
}

class _AssignDriverState extends State<AssignDriver> {
  @override
  void initState() {
    context.read<DriverCubit>().fetchGetAllActiveDriver();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return BlocConsumer<AdminHomeCubit, AdminHomeState>(
      listener: (context, state) {
        if (state is UpdateAdminOrderStatusSuccess) {
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
                appBar: AppBar(
                    title:  Text(
                   context.translate(AppStrings.assignDriver),
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )),
                body: Column(
                  children: [
                    _orderInformation(responsive),
                    _driverCardInformayion(responsive),
                  ],
                )),
            LoadingOverlay(
              isLoading: state is UpdateAdminOrderStatusLoading,
            ),
          ],
        );
      },
    );
  }

  BlocBuilder<DriverCubit, DriverState> _driverCardInformayion(
      ResponsiveUtils responsive) {
    return BlocBuilder<DriverCubit, DriverState>(
      builder: (context, state) {
        final cubit = context.read<DriverCubit>();

        if (state is GetAllActiveDriverLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: ColorManger.brun,
          ));
        }

        if (state is GetAllActiveDriverSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: cubit.allActiveDriver.length,
              itemBuilder: (context, index) {
                final driver = cubit.allActiveDriver[index];
                return Container(
                  margin: responsive.setMargin(
                    left: 3,
                    right: 3,
                    top: 0,
                    bottom: 1,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManger.backgroundItem,
                    borderRadius:
                        BorderRadius.circular(responsive.setBorderRadius(3)),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(responsive.setBorderRadius(3)),
                      child: CachedNetworkImage(
                        imageUrl: driver.image ?? "",
                        height: responsive.setHeight(9),
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
                      driver.name ?? "",
                      style: TextStyle(
                          fontSize: responsive.setTextSize(3.5),
                          fontWeight: FontWeight.bold,
                          color: ColorManger.brun),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          IconlyBold.call,
                          color: ColorManger.brun,
                          size: responsive.setTextSize(3.8),
                        ),
                        SizedBox(width: responsive.setWidth(2)),
                        Text(
                          driver.phone ?? "",
                          style: TextStyle(
                              fontSize: responsive.setTextSize(3.2),
                              color: ColorManger.brun),
                        ),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () => context
                          .read<AdminHomeCubit>()
                          .updateAdminOrderStatusSummit(
                            id: widget.orderModel.sId ?? "",
                            driverId: driver.sId ?? "",
                            driverAcceptedAt: DateTime.now().toIso8601String(),
                            status: 3,
                          ),
                      child: Container(
                        alignment: Alignment.center,
                        width: responsive.setWidth(20),
                        height: responsive.setHeight(4),
                        decoration: BoxDecoration(
                          color: ColorManger.brun,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Assign",
                          style: TextStyle(
                              fontSize: responsive.setTextSize(3.2),
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return const Center(child: Text("No drivers found"));
      },
    );
  }

  Container _orderInformation(ResponsiveUtils responsive) {
    return Container(
      margin: responsive.setMargin(
        left: 3,
        right: 3,
        top: 1,
        bottom: 1,
      ),
      padding: responsive.setPadding(
        left: 2,
        right: 3,
        top: 2,
        bottom: 1,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManger.backgroundItem,
      ),
      width: double.infinity,
      height: responsive.setHeight(11),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                ImageAsset.order,
                height: responsive.setHeight(2.5),
              ),
              SizedBox(width: responsive.setWidth(2)),
              Text(
                "#${widget.orderModel.sId}",
                style: TextStyle(
                    fontSize: responsive.setTextSize(3.2),
                    color: ColorManger.brun),
              ),
            ],
          ),
          SizedBox(height: responsive.setHeight(2)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                ImageAsset.calendar,
                height: responsive.setHeight(2.5),
              ),
              SizedBox(width: responsive.setWidth(2)),
              Text(
                widget.orderModel.adminCompletedAt!.getFormattedDate(),
                style: TextStyle(
                    fontSize: responsive.setTextSize(3.2),
                    color: ColorManger.brun),
              ),
              SizedBox(width: responsive.setWidth(2)),
              Container(
                height: responsive.setHeight(2.5),
                width: responsive.setWidth(0.2),
                color: ColorManger.brownLight,
              ),
              Image.asset(
                ImageAsset.money,
                height: responsive.setHeight(2.5),
              ),
              SizedBox(width: responsive.setWidth(2)),
              Text(
                "${widget.orderModel.totalOrderPrice} EGP",
                style: TextStyle(
                    fontSize: responsive.setTextSize(3.2),
                    color: ColorManger.brun),
              ),
              SizedBox(width: responsive.setWidth(2)),
              Container(
                height: responsive.setHeight(2.5),
                width: responsive.setWidth(0.2),
                color: ColorManger.brownLight,
              ),
              Image.asset(
                ImageAsset.debitCard,
                height: responsive.setHeight(2.5),
              ),
              SizedBox(width: responsive.setWidth(2)),
              Text(
                "${widget.orderModel.paymentMethodType}",
                style: TextStyle(
                    fontSize: responsive.setTextSize(3.2),
                    color: ColorManger.brun),
              ),
              SizedBox(width: responsive.setWidth(2)),
              Container(
                height: responsive.setHeight(2.5),
                width: responsive.setWidth(0.2),
                color: ColorManger.brownLight,
              ),
              Image.asset(
                ImageAsset.stationery,
                height: responsive.setHeight(2.5),
              ),
              SizedBox(width: responsive.setWidth(2)),
              Text(
                "${widget.orderModel.orderNumber}",
                style: TextStyle(
                    fontSize: responsive.setTextSize(3.2),
                    color: ColorManger.brun),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
