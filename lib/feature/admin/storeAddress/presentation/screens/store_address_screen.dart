import 'package:elminiawy/core/common/shared/shared_imports.dart';

import 'package:elminiawy/feature/admin/storeAddress/logic/store_address_cubit.dart';
import 'package:elminiawy/feature/admin/storeAddress/presentation/widgets/get_address_store_loading_widget.dart';
import 'package:flutter/cupertino.dart';

class StoreAddressScreen extends StatefulWidget {
  const StoreAddressScreen({super.key});

  @override
  State<StoreAddressScreen> createState() => _StoreAddressScreenState();
}

class _StoreAddressScreenState extends State<StoreAddressScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoreAddressCubit>().fetchStoreAddressDriver();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<StoreAddressCubit, StoreAddressState>(
      builder: (context, state) {
        final allStoreAddress =
            context.read<StoreAddressCubit>().allStoreAddress;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Store Address",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: responsive.setTextSize(4)),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive.setWidth(4),
                    vertical: responsive.setHeight(1.2)),
                child: SizedBox(
                  height: responsive.setHeight(12),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildSummaryCard(
                          responsive,
                          'Total Stores',
                          '${allStoreAddress.length}',
                          ColorManger.backgroundItem),
                      SizedBox(width: responsive.setWidth(3.5)),
                      _buildSummaryCard(
                          responsive,
                          'Active Stores',
                          '${context.read<StoreAddressCubit>().activeStores}',
                          ColorManger.backgroundItem),
                      SizedBox(width: responsive.setWidth(3.5)),
                      _buildSummaryCard(
                          responsive,
                          'DeActive Stores',
                          '${context.read<StoreAddressCubit>().deActiveStores}',
                          ColorManger.backgroundItem),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: responsive.setPadding(
                    top: 1,
                  ),
                  itemCount: state is GetStoreAddressLoading
                      ? 5
                      : allStoreAddress.length,
                  itemBuilder: (context, index) {
                    if (state is GetStoreAddressLoading) {
                      return const GetAddressStoreLoadingWidget();
                    }
                    return Container(
                      margin:
                          responsive.setMargin(left: 5, right: 5, bottom: 1.5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.1),
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
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: responsive.setWidth(3),
                          ),
                          title: Text(
                            "${allStoreAddress[index].branchArea} Branch",
                            style: TextStyle(
                                fontSize: responsive.setTextSize(3.5),
                                fontWeight: FontWeight.bold,
                                color: ColorManger.brun),
                          ),
                          subtitle: Text(
                            overflow: TextOverflow.ellipsis,
                            "${allStoreAddress[index].region}",
                            style: TextStyle(
                                fontSize: responsive.setTextSize(3.2),
                                color: ColorManger.brunLight),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                IconlyBold.location,
                                color: Colors.green.shade500,
                              ),
                              SizedBox(
                                width: responsive.setWidth(2),
                              ),
                              Text(
                                "Available",
                                style: TextStyle(
                                    fontSize: responsive.setTextSize(3.5),
                                    color: ColorManger.brunLight),
                              ),
                              SizedBox(
                                width: responsive.setWidth(2),
                              ),
                              CupertinoSwitch(
                                value: allStoreAddress[index].active!,
                                activeTrackColor: Colors.green.shade500,
                                onChanged: (value) {},
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummaryCard(
      ResponsiveUtils responsive, String title, String value, Color bg) {
    return Container(
      width: responsive.setWidth(28),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(responsive.setBorderRadius(2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.06),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: responsive.setTextSize(3.5),
              color: ColorManger.brunLight,
            ),
          ),
          SizedBox(height: responsive.setHeight(2)),
          Text(
            value,
            style: TextStyle(
              fontSize: responsive.setTextSize(5),
              color: ColorManger.brun,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

