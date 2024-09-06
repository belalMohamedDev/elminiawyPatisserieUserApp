import 'package:elminiawy/core/common/sharedWidget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../address/logic/userAddressCubit/user_address_cubit.dart';
import '../widget/check_out_processing.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

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

class ShippingAddressBody extends StatelessWidget {
  const ShippingAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 25.w, left: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CheckOutProcessing(
            screenIndex:1,
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
          _shippingAddresssContainer(context),
          SizedBox(
            height: 35.h,
          ),
          CustomButton(
            onPressed: () {},
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

  Container _shippingAddresssContainer(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorManger.brownLight,
          width: 0.5.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    height: 30.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: ColorManger.brun,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Text(
                        'Default',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: FontConsistent.fontFamilyAcme,
                            color: ColorManger.white,
                            fontSize: 13.sp),
                      ),
                    )),
                const Spacer(),
                Icon(IconlyBold.location, color: ColorManger.brun),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  'Change',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      decoration: TextDecoration.underline,
                      color: ColorManger.brun,
                      fontSize: 13.sp),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'fakous,elsharqid,ffjkkkkkk',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brun,
                  fontSize: 13.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '01069225923',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brownLight,
                  fontSize: 13.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Icon(IconlyBold.location, color: ColorManger.brun),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'fakous,elsharqid,ffjkkkkkk',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 13.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder _mapWidget(
    BuildContext context,
    //  LatLng latLng, List<MarkerData> markerData
  ) {
    return BlocBuilder<UserAddressCubit, UserAddressState>(
      builder: (context, state) {
        return Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: SizedBox(
                    height: 140.h,
                    width: double.infinity,
                    child: const GoogleMap(
                      zoomControlsEnabled: false,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(30.73148352751841, 31.79803739729101),
                          zoom: 16),
                      //  markers: markers ?? {},
                    )
                    // CustomGoogleMapMarkerBuilder(
                    //  //   customMarkers: markerData,
                    //     builder: (p0, Set<Marker>? markers) {
                    //       return
                    //        GoogleMap(
                    //         zoomControlsEnabled: false,
                    //         initialCameraPosition:
                    //             CameraPosition(target: latLng, zoom: 13),
                    //         markers: markers ?? {},
                    //       );
                    //     },
                    //   ),
                    )),
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
                    Icon(IconlyBold.location, color: ColorManger.brun),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'You\'re Here',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
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
            color: ColorManger.brun,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            'Changing the address might affect your cart',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
