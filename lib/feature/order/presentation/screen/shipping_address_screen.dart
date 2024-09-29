


import '../../../../core/common/shared/shared_imports.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  @override
  void initState() {
    final userAddressCubit = context.read<UserAddressCubit>();
    final mapCubit = context.read<MapCubit>();

    LatLng latLng = LatLng(
        userAddressCubit
            .addressDataList[context.read<PaymentCubit>().selectedIndex]
            .location!
            .coordinates!
            .last,
        userAddressCubit
            .addressDataList[context.read<PaymentCubit>().selectedIndex]
            .location!
            .coordinates!
            .first);


    mapCubit.addCurrentLocationMarkerToMap(latLng);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CheckOut",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
      ),
      body: const ShippingAddressBody(),
    );
  }
}
