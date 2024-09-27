import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/style/color/color_manger.dart';
import '../../../../../core/style/fonts/font_manger.dart';
import '../../../logic/mapCubit/map_cubit.dart';

class PickLocationButton extends StatelessWidget {
  const PickLocationButton({
    super.key,
    required this.isUpdateMap, required this.mapCubit, required this.mapState,
  });

  final bool isUpdateMap;
  final MapCubit mapCubit;
  final MapState mapState;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30.h,
      left: 20.w,
      right: 20.w,
      child: CustomButton(
        onPressed: () async {
          if (mapCubit.checkLocationAvailableResponse != null) {
            if (mapCubit.checkLocationAvailableResponse!
                        .storeAddressAvailable ==
                    true &&
                mapCubit.checkLocationAvailableResponse!.isAddressAvailable ==
                    true) {
              if (isUpdateMap == true) {
                mapCubit.moveToLocation(
                    position: mapCubit.targetPosition,
                    controller: mapCubit.newAddressMapController);
                Navigator.pop(context);
              } else {
                // Use the context only if the widget is still mounted.

                Navigator.popAndPushNamed(
                  context,
                  Routes.addNewAddress,
                );
              }
            }
          }
        },
        widget: mapState is CheckAddressAvailableLoading
            ? SizedBox(
                height: 25.h,
                width: 25.w,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5.w,
                    color: ColorManger.white,
                  ),
                ),
              )
            : Text(
                mapCubit.checkLocationAvailableResponse != null
                    ? mapCubit.checkLocationAvailableResponse!
                                    .storeAddressAvailable ==
                                true &&
                            mapCubit.checkLocationAvailableResponse!
                                    .isAddressAvailable ==
                                true
                        ? "Pick Location"
                        : mapCubit.checkLocationAvailableResponse!
                                    .isAddressAvailable ==
                                false
                            ? "Address not found in this area"
                            : "Service not available in this area"
                    : "Enter Complete address",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16.sp,
                      color: ColorManger.white,
                      fontWeight: FontWeightManger.semiBold,
                    ),
              ),
      ),
    );
  }
}
