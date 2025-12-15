import 'package:elminiawy/core/common/shared/shared_imports.dart';

import 'package:elminiawy/feature/admin/storeAddress/logic/store_address_cubit.dart';
import 'package:elminiawy/feature/admin/storeAddress/presentation/screens/add_new_store_screen.dart';
import 'package:elminiawy/feature/admin/storeAddress/presentation/widgets/get_address_store_loading_widget.dart';

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
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    return BlocBuilder<StoreAddressCubit, StoreAddressState>(
      builder: (context, state) {
        final allStoreAddress = context
            .read<StoreAddressCubit>()
            .allStoreAddress;
        return Scaffold(
          appBar: _storeAddressScreenAppBar(context, responsive, state),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.setWidth(4),
                  vertical: responsive.setHeight(1.2),
                ),
                child: SizedBox(
                  height: responsive.setHeight(12),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildSummaryCard(
                        responsive,
                        context.translate(AppStrings.totalStores),
                        '${allStoreAddress.length}',
                        ColorManger.backgroundItem,
                      ),
                      SizedBox(width: responsive.setWidth(3.5)),
                      _buildSummaryCard(
                        responsive,
                        context.translate(AppStrings.activeStores),
                        '${context.read<StoreAddressCubit>().activeStores}',
                        ColorManger.backgroundItem,
                      ),
                      SizedBox(width: responsive.setWidth(3.5)),
                      _buildSummaryCard(
                        responsive,
                        context.translate(AppStrings.deActiveStores),
                        '${context.read<StoreAddressCubit>().deActiveStores}',
                        ColorManger.backgroundItem,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: responsive.setPadding(top: 1),
                  itemCount: state is GetStoreAddressLoading
                      ? 5
                      : allStoreAddress.length,
                  itemBuilder: (context, index) {
                    if (state is GetStoreAddressLoading) {
                      return const GetAddressStoreLoadingWidget();
                    }
                    return Container(
                      margin: responsive.setMargin(
                        left: 5,
                        right: 5,
                        bottom: 1.5,
                      ),
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
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: responsive.setWidth(3),
                        ),
                        leading: Icon(
                          IconlyBold.location,
                          color: Colors.green.shade500,
                        ),
                        title: Text(
                          isEnLocale
                              ? "${allStoreAddress[index].branchArea} ${context.translate(AppStrings.branch)}"
                              : "${context.translate(AppStrings.branch)} ${allStoreAddress[index].branchArea}",
                          style: TextStyle(
                            fontSize: responsive.setTextSize(3.5),
                            fontWeight: FontWeight.bold,
                            color: ColorManger.brun,
                          ),
                        ),
                        subtitle: Text(
                          overflow: TextOverflow.ellipsis,
                          "${allStoreAddress[index].region}",
                          style: TextStyle(
                            fontSize: responsive.setTextSize(3.2),
                            color: ColorManger.brunLight,
                          ),
                        ),
                      ),
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

  AppBar _storeAddressScreenAppBar(
    BuildContext context,
    ResponsiveUtils responsive,
    StoreAddressState state,
  ) {
    return AppBar(
      title: Text(
        context.translate(AppStrings.storeAddress),
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(fontSize: responsive.setTextSize(4)),
      ),
      actions: [
        (state is GetActiveAdminsLoading)
            ? const SizedBox()
            : GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => instance<StoreAddressCubit>(),
                        child: AddNewStoreScreen(),
                      ),
                    ),
                  );
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

  Widget _buildSummaryCard(
    ResponsiveUtils responsive,
    String title,
    String value,
    Color bg,
  ) {
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
