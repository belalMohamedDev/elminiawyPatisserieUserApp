import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:elminiawy/feature/payment/cubit/payment_cubit.dart';
import 'package:elminiawy/feature/payment/presentation/screen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/utils/persistent_nav_bar_navigator.dart.dart';
import '../../../address/logic/mapCubit/map_cubit.dart';
import '../../../address/logic/userAddressCubit/user_address_cubit.dart';
import '../../../address/presentation/screen/add_new_address_screen.dart';
import '../widget/check_out_processing.dart';

class ShippingAddressBody extends StatefulWidget {
  const ShippingAddressBody({super.key});

  @override
  State<ShippingAddressBody> createState() => _ShippingAddressBodyState();
}

class _ShippingAddressBodyState extends State<ShippingAddressBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 15.h, right: 25.w, left: 25.w, bottom: 45.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CheckOutProcessing(
            screenIndex: 1,
          ),
          SizedBox(
            height: 30.h,
          ),
          _changingAddressText(context),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Current Location',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 14.h,
          ),
          _mapWidget(context),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Shipping Address',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 14.h,
          ),
          BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              return _shippingAddresssContainer(
                  context: context, isSippingAddressCheckOut: true);
            },
          ),
          const Spacer(),
          CustomButton(
            onPressed: () {
              NavBarNavigator.push(context,
                  screen: const PaymentScreen(), withNavBar: false);
            },
            radius: 8.r,
            widget: Text(
              'Save and Continue',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.white,
                  fontSize: 13.sp),
            ),
          )
        ],
      ),
    );
  }

  Container _shippingAddresssContainer(
      {required BuildContext context,
      bool isChosseAddress = false,
      bool isSelected = false,
      bool isSippingAddressCheckOut = false,
      int index = 0}) {
    final userAddressCubit = context.read<UserAddressCubit>().addressDataList[
        isSippingAddressCheckOut
            ? context.read<PaymentCubit>().selectedIndex
            : index];

    return Container(
      height: isSelected ? 100.h : 145.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isChosseAddress
              ? ColorManger.backgroundItem
              : ColorManger.backgroundItem,
          width: 0.5.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: isSelected ? 0.h : 18.h, left: 10.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isSelected
                ? const SizedBox()
                : Row(
                    children: [
                      Container(
                          height: 30.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: ColorManger.brun,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              'Default',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontFamily: FontConsistent.fontFamilyAcme,
                                      color: ColorManger.white,
                                      fontSize: 13.sp),
                            ),
                          )),
                      const Spacer(),
                      isChosseAddress
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {
                                _chaneProfileDataaBottomSheet(context);
                              },
                              child: Icon(
                                IconlyBold.location,
                                color: ColorManger.brun,
                              ),
                            ),
                      isChosseAddress
                          ? const SizedBox()
                          : SizedBox(
                              width: 2.w,
                            ),
                      isChosseAddress
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {
                                _chaneProfileDataaBottomSheet(context);
                              },
                              child: Text(
                                'Change',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        decoration: TextDecoration.underline,
                                        color: ColorManger.brun,
                                        fontSize: 13.sp),
                              ),
                            ),
                    ],
                  ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Icon(
                  IconlyBold.home,
                  color: isChosseAddress
                      ? ColorManger.brun
                      : ColorManger.brunLight,
                  size: 15.sp,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  userAddressCubit.buildingName!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: isChosseAddress
                          ? ColorManger.brun
                          : ColorManger.brunLight,
                      fontSize: 10.sp),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Icon(
                  IconlyBold.call,
                  color: isChosseAddress
                      ? ColorManger.brun
                      : ColorManger.brunLight,
                  size: 15.sp,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  userAddressCubit.phone!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: isChosseAddress
                          ? ColorManger.brun
                          : ColorManger.brunLight,
                      fontSize: 10.sp),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Icon(
                  IconlyBold.location,
                  color: isChosseAddress
                      ? ColorManger.brun
                      : ColorManger.brunLight,
                  size: 15.sp,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  userAddressCubit.region!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: isChosseAddress
                          ? ColorManger.brun
                          : ColorManger.brunLight,
                      fontSize: 10.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder _mapWidget(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: SizedBox(
                    height: 140.h,
                    width: double.infinity,
                    child: CustomGoogleMapMarkerBuilder(
                        customMarkers: context.read<MapCubit>().markers,
                        builder: (p0, Set<Marker>? markers) {
                          return GoogleMap(
                            onMapCreated: (controller) => context
                                .read<MapCubit>()
                                .setMapController(controller),
                            zoomControlsEnabled: false,
                            initialCameraPosition: CameraPosition(
                                target: context.read<MapCubit>().targetPosition,
                                zoom: 18),
                            markers: markers ?? {},
                          );
                        }))),
            Positioned(
              bottom: 8.w,
              right: 100.w,
              child: Container(
                height: 40.h,
                width: 120.w,
                decoration: BoxDecoration(
                    color: ColorManger.white,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(IconlyBold.location, color: ColorManger.brunLight),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'You\'re Here',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brunLight,
                          fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Container _changingAddressText(BuildContext context) {
    return Container(
      height: 30.h,
      decoration: BoxDecoration(
          color: ColorManger.backgroundItem,
          borderRadius: BorderRadius.circular(5.r)),
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          Icon(
            IconlyBroken.buy,
            color: ColorManger.brunLight,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            'Changing the address might affect your cart',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brunLight,
                fontSize: 13.sp),
          ),
        ],
      ),
    );
  }

  void _chaneProfileDataaBottomSheet(BuildContext context) {
    final userAddressCubit = context.read<UserAddressCubit>().addressDataList;

    showCupertinoModalBottomSheet(
      useRootNavigator: true,
      barrierColor: Colors.black54,
      elevation: 20.r,
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding:
              EdgeInsets.only(right: 18.w, left: 18.w, top: 35.h, bottom: 30.h),
          child: Material(
            color: ColorManger.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50.h,
                      width: 2.w,
                      color: ColorManger.brunLight,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Address',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.brun,
                                  fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'You can edit your address from your settings',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.brunLight,
                                  fontSize: 12.sp),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Expanded(
                  child: BlocBuilder<PaymentCubit, PaymentState>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: userAddressCubit.length,
                        addAutomaticKeepAlives: true,
                        itemBuilder: (context, index) {
                          final isSelected =
                              context.read<PaymentCubit>().selectedIndex !=
                                  index;
                          final isChosseAddress =
                              context.read<PaymentCubit>().selectedIndex ==
                                  index;

                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<PaymentCubit>()
                                    .changeShippingIndex(index);
                              },
                              child: _shippingAddresssContainer(
                                  context: context,
                                  isChosseAddress: isChosseAddress,
                                  isSelected: isSelected,
                                  index: index),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                CustomButton(
                  onPressed: () async {
                    final userAddressCubit = context.read<UserAddressCubit>();
                    final mapCubit = context.read<MapCubit>();

                    LatLng latLng = LatLng(
                        userAddressCubit
                            .addressDataList[
                                context.read<PaymentCubit>().selectedIndex]
                            .location!
                            .coordinates!
                            .last,
                        userAddressCubit
                            .addressDataList[
                                context.read<PaymentCubit>().selectedIndex]
                            .location!
                            .coordinates!
                            .first);

                    await mapCubit.moveToLocation(latLng);

                    Navigator.pop(context);
                  },
                  radius: 8.r,
                  widget: Text('Save Changes',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.white,
                          fontSize: 13.sp)),
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  onPressed: () async {
                    final mapCubit = context.read<MapCubit>();
                    mapCubit.getCurrentLocation(context);
                    final address = await mapCubit.getAddressFromLatLng(
                        mapCubit.targetPosition.latitude,
                        mapCubit.targetPosition.longitude);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                AddNewAddressScreen(
                                  latLng: mapCubit.targetPosition,
                                  markerData: mapCubit.markers,
                                  addressAreaInformation: address,
                                  isPaymentAddress: true,
                                )));
                  },
                  color: ColorManger.brownLight,
                  radius: 8.r,
                  widget: Text('Add New',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 15.sp)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
