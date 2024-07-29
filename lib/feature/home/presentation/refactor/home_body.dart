import 'package:elminiawy/feature/search/presentation/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/utils/persistent_nav_bar_navigator.dart.dart';
import '../widget/banner_carousel_slider.dart';
import '../widget/category_list_view_builder.dart';
import '../widget/new_product_gride_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _locationAndNotificationRow(context),
              _locationName(context),
              SizedBox(
                height: 20.h,
              ),
              _searchRow(context),
              SizedBox(
                height: 30.h,
              ),
              const BannerCarouselSlider(),
              SizedBox(
                height: 30.h,
              ),
              const CategoryListViewBuilder(),
              SizedBox(
                height: 20.h,
              ),
              const NewProductGrideView(),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _searchRow(BuildContext context) {
    return InkWell(
      onTap: () {
        NavBarNavigator.push(context,
            screen: const SearchView(), withNavBar: false);
      },
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'Find Your Patisserie',
                  prefixIcon: Icon(IconlyBroken.search,
                      size: 18.sp, color: ColorManger.brunLight),
                  hintStyle: TextStyle(color: ColorManger.brunLight),
                  fillColor: ColorManger.backgroundItem,
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManger.backgroundItem,
                    ),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 41.h,
            margin: EdgeInsets.only(left: 10.w, right: 5.w),
            decoration: BoxDecoration(
              color: ColorManger.brun,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: IconButton(
              icon: Icon(IconlyBroken.filter, color: ColorManger.white),
              onPressed: () {
                NavBarNavigator.push(context,
                    screen: const SearchView(), withNavBar: false);
              },
            ),
          ),
        ],
      ),
    );
  }

  Row _locationName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(IconlyBold.location, color: ColorManger.brown),
        SizedBox(
          width: 5.w,
        ),
        Text("New York, USA",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 14.sp)),
        SizedBox(
          width: 5.w,
        ),
        Icon(
          IconlyBold.arrowDown2,
          color: ColorManger.brown,
          size: 15.sp,
        ),
      ],
    );
  }

  Row _locationAndNotificationRow(BuildContext context) {
    return Row(
      children: [
        Text("Location",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brunLight,
                fontSize: 14.sp)),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(IconlyBold.notification, color: ColorManger.brun),
        )
      ],
    );
  }
}
