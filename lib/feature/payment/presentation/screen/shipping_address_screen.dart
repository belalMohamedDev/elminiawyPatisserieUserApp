import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../address/logic/mapCubit/map_cubit.dart';
import '../../../address/logic/userAddressCubit/user_address_cubit.dart';
import '../refactor/shipping_screen_body.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  List<MarkerData>? markerData;
  @override
  void initState() {
    final userAddressCubit = context.read<UserAddressCubit>();
    final mapCubit = context.read<MapCubit>();

    LatLng latLng = LatLng(
        userAddressCubit.addressDataList.first.location!.coordinates!.last,
        userAddressCubit.addressDataList.first.location!.coordinates!.first);

    mapCubit.addCurrentLocationMarkerToMap(latLng);
    markerData= mapCubit.markers;
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
      body:  ShippingAddressBody(markerData: markerData,),
    );
  }
}
