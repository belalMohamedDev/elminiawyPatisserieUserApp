import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../feature/search/presentation/screen/search_screen.dart';
import '../../style/color/color_manger.dart';
import '../../utils/persistent_nav_bar_navigator.dart.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}
