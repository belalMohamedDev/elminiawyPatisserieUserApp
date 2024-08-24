import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../refactor/add_new_address_body.dart';

class AddNewAddressScreen extends StatelessWidget {
  final LatLng latLng;
  final List<MarkerData> markerData;
  final String addressAreaInformation;
  const AddNewAddressScreen(
      {super.key,
      required this.latLng,
      required this.markerData,
      required this.addressAreaInformation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Address",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: AddNewAddressBody(
        latLng: latLng,
        markerData: markerData,
        addressAreaInformation: addressAreaInformation,
      ),
    );
  }
}

