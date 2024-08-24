import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:elminiawy/core/utils/extensions.dart';
import 'package:elminiawy/feature/address/logic/userAddressCubit/user_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../data/model/response/get_address_response.dart';
import '../refactor/add_new_address_body.dart';

class AddNewAddressScreen extends StatefulWidget {
  final LatLng? latLng;
  final List<MarkerData>? markerData;
  final String? addressAreaInformation;
  final GetAddressResponseData? getAddressResponseData;

  const AddNewAddressScreen(
      {super.key,
      this.latLng,
      this.markerData,
      this.addressAreaInformation,
      this.getAddressResponseData});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  @override
  void initState() {
    if (widget.getAddressResponseData != null) {
      final userAddressCubit = context.read<UserAddressCubit>();
      userAddressCubit.aliasData =
          widget.getAddressResponseData!.alias ?? 'Apartment';
      userAddressCubit.regionAreaIndex = userAddressCubit.regionArea.indexWhere(
          (element) =>
              element['text'] ==
              (widget.getAddressResponseData!.alias ?? 'Apartment'));

      userAddressCubit.buildingNameController.text =
          widget.getAddressResponseData?.buildingName ?? '';

      userAddressCubit.companyController.text =
          widget.getAddressResponseData?.apartmentNumber ?? '';

      userAddressCubit.floorController.text =
          widget.getAddressResponseData?.floor ?? '';

      userAddressCubit.streetController.text =
          widget.getAddressResponseData?.streetName ?? '';

      userAddressCubit.additionalDirectionsContoller.text =
          widget.getAddressResponseData?.additionalDirections ?? '';

      userAddressCubit.phoneNumberContoller.text =
          widget.getAddressResponseData?.phone ?? '';

      userAddressCubit.addressLabel.text =
          widget.getAddressResponseData?.addressLabel ?? '';
    }

    super.initState();
  }

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
        getAddressResponseData: widget.getAddressResponseData,
        latLng: widget.latLng!,
        markerData: widget.markerData!,
        addressAreaInformation: widget.addressAreaInformation!,
      ),
    );
  }
}
