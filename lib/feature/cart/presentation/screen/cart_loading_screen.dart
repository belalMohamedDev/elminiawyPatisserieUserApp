import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/loading/loading_shimmer.dart';
import '../../../../core/style/color/color_manger.dart';

class LoadingCartScreen extends StatelessWidget {
  const LoadingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w, bottom: 10.h),
        child: Column(
          children: [
            _cardItemLoading(),
            SizedBox(
              height: 10.h,
            ),
            _cardItemLoading(),
            SizedBox(
              height: 10.h,
            ),
            _cardItemLoading(),
            SizedBox(
              height: 10.h,
            ),
            _cardItemLoading(),
            SizedBox(
              height: 10.h,
            ),
            _paymentCartLoading()
          ],
        ),
      ),
    );
  }

  Container _paymentCartLoading() {
    return Container(
      height: 210.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadingShimmer(
              height: 4.h,
              width: 280.w,
              borderRadius: 12.r,
            ),
            SizedBox(
              height: 10.h,
            ),
            LoadingShimmer(
              height: 4.h,
              width: 180.w,
              borderRadius: 12.r,
            ),
            SizedBox(
              height: 10.h,
            ),
            LoadingShimmer(
              height: 4.h,
              width: 100.w,
              borderRadius: 12.r,
            ),
            SizedBox(
              height: 30.h,
            ),
            LoadingShimmer(
              height: 10.h,
              width: 300.w,
              borderRadius: 5.r,
            ),
            SizedBox(
              height: 10.h,
            ),
            LoadingShimmer(
              height: 10.h,
              width: 200.w,
              borderRadius: 5.r,
            ),
            SizedBox(
              height: 30.h,
            ),
            LoadingShimmer(
              height: 4.h,
              width: 280.w,
              borderRadius: 12.r,
            ),
            SizedBox(
              height: 10.h,
            ),
            LoadingShimmer(
              height: 4.h,
              width: 120.w,
              borderRadius: 12.r,
            ),
          ],
        ),
      ),
    );
  }

  Container _cardItemLoading() {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Image.asset(
            ImageAsset.picture,
            height: 60.h,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoadingShimmer(
                height: 4.h,
                width: 220.w,
                borderRadius: 12.r,
              ),
              SizedBox(
                height: 10.h,
              ),
              LoadingShimmer(
                height: 4.h,
                width: 140.w,
                borderRadius: 12.r,
              ),
              SizedBox(
                height: 10.h,
              ),
              LoadingShimmer(
                height: 4.h,
                width: 80.w,
                borderRadius: 12.r,
              ),
            ],
          )
        ],
      ),
    );
  }
}
