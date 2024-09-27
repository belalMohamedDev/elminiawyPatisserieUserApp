import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/style/color/color_manger.dart';
import '../../../logic/mapCubit/map_cubit.dart';


class BuildSearchBar extends StatelessWidget {

  const BuildSearchBar({
    super.key, required this.mapCubit,
 
  });
    final MapCubit mapCubit;

  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: 45.h,
      right: 20.w,
      left: 20.w,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        child: TextFormField(
          onChanged: (value) {
            mapCubit.searchLocation(value);
          },
          style: TextStyle(color: ColorManger.white),
          controller: mapCubit.searchConroller,
          decoration: InputDecoration(
              hintText: mapCubit.textEditingSearchText,
              prefixIcon: Icon(IconlyBroken.search,
                  size: 18.sp, color: ColorManger.white),
              hintStyle: const TextStyle(color: Colors.white60),
              fillColor: ColorManger.brunLight,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.brunLight,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.brunLight,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              )),
        ),
      ),
    );
  }
}
