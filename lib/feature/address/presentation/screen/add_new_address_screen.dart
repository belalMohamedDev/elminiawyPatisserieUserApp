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
import '../../logic/mapCubit/map_cubit.dart';
import '../refactor/add_new_address_body.dart';

class AddNewAddressScreen extends StatefulWidget {
  final GetAddressResponseData? getAddressResponseData;
  final bool isPaymentAddress;

  const AddNewAddressScreen(
      {super.key, this.isPaymentAddress = false, this.getAddressResponseData});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  @override
  void initState() {
    super.initState();
    _addNewAddressInitFunction();
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
            context.read<MapCubit>().checkLocationAvailableResponse = null;

            context.read<MapCubit>().textEditingSearchText =
                'Find Your Location';

            context.pop();
          },
        ),
      ),
      body: AddNewAddressBody(
        getAddressResponseData: widget.getAddressResponseData,
        isPaymentAddress: widget.isPaymentAddress,
      ),
    );
  }

  void _addNewAddressInitFunction() {
    if (widget.getAddressResponseData != null) {
      LatLng latLng = LatLng(
          widget.getAddressResponseData!.location!.coordinates![1],
          widget.getAddressResponseData!.location!.coordinates![0]);

      final mapCubit = context.read<MapCubit>();
      mapCubit.addCurrentLocationMarkerToMap(latLng);

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
    } else {
      final userAddressCubit = context.read<UserAddressCubit>();

      userAddressCubit.clearAllControllers();
      userAddressCubit.regionAreaIndex = userAddressCubit.regionArea
          .indexWhere((element) => element['text'] == ('Apartment'));
    }
  }
}
