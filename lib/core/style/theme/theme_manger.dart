import 'package:elminiawy/core/style/fonts/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/color_manger.dart';
import 'package:flutter/services.dart';
// import 'package:sizer/sizer.dart';
//
// import 'color_manger.dart';
// import 'font_manger.dart';
import '../fonts/styles_manger.dart';

// import 'values_manger.dart';
//
ThemeData getApplicationTheme() {
  return ThemeData(
//
// //main color
//       primaryColor: ColorManger.gradationLightBlue,
      scaffoldBackgroundColor: ColorManger.white,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),

// //Button theme
//       buttonTheme: ButtonThemeData(
//           buttonColor: ColorManger.lightBlue,
//           disabledColor: ColorManger.darkBlue,
//           splashColor: ColorManger.blue,
//           shape: const StadiumBorder()),
//
// //elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: ColorManger.brun,
        textStyle: getSemiBoldStyle(
          fontSize: 14.sp,
          color: ColorManger.white,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        fixedSize: Size.fromHeight(40.h),
      )),
//
// //appbar theme
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManger.white,
              statusBarIconBrightness: Brightness.dark),
          color: ColorManger.white),

// //text theme
//
      textTheme: TextTheme(
// using in text on boarding
        titleLarge: getMediumStyle(
          fontSize: 22.sp,
          color: ColorManger.brun,
        ),

        //using in profile page
        headlineSmall: getMediumStyle(
          fontSize: 16.sp,
          color: ColorManger.brun,
        ),

        bodySmall: getMediumStyle(
          fontSize: 12.sp,
          color: Colors.grey.shade500,
        ),

        titleSmall: getMediumStyle(
          fontSize: 14.sp,
          color: ColorManger.black,
        ),

        bodyLarge: TextStyle(
          fontSize: 13.sp,
          color: ColorManger.brunLight,
        ),
        // getLightStyle(
        //   fontSize: 12.sp,
        //   color: ColorManger.brun,
        // ),

        titleMedium:
            getSemiBoldStyle(fontSize: 12.sp, color: ColorManger.brunLight),
      ),

// // using in text on boarding

//
// //use in on boarding  button
//         titleSmall: getSemiBoldStyle(
//           fontSize: FontSize.s12.sp,
//           color: ColorManger.black,
//         ),
//
// //use in on boarding  button
//         headlineLarge: getMediumStyle(
//           fontSize: FontSize.s12.sp,
//           color: ColorManger.white,
//         ),
//           //use in on about profile page
//         bodyLarge: getMediumStyle(
//             fontSize:FontSize.s14.sp,
//             color: ColorManger.blackText),
//       ),
//

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.brown.shade50,
        showUnselectedLabels: true,
      ),

// Theme.of(context).copyWith(
//         canvasColor: Colors.green,
//         // sets the active color of the `BottomNavigationBar` if `Brightness` is light
//         primaryColor: Colors.red,
//         textTheme: Theme
//             .of(context)
//             .textTheme
//             .copyWith(caption: new TextStyle(color: Colors.yellow))),
// input decoration theme ( text form field )
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        prefixStyle: getMediumStyle(
          fontSize: 13.sp,
          color: ColorManger.black26,
        ),
        hintStyle: getMediumStyle(
          fontSize: 11.sp,
          color: ColorManger.black26,
        ),
        errorStyle: TextStyle(
            fontSize: 11.sp,
            fontFamily: FontConsistent.fontFamilyCairo,
            fontWeight: FontWeight.w500),
        prefixIconColor: WidgetStateColor.resolveWith((states) =>
            states.contains(WidgetState.focused)
                ? ColorManger.brunLight
                : ColorManger.black26),
        suffixIconColor: WidgetStateColor.resolveWith((states) =>
            states.contains(WidgetState.focused)
                ? ColorManger.brunLight
                : ColorManger.black26),
        labelStyle: getMediumStyle(
          fontSize: 10.sp,
          color: ColorManger.black26,
        ),
        filled: true,
        fillColor: ColorManger.white,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.selected),
            borderRadius: BorderRadius.circular(12.r)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:
                BorderSide(color: ColorManger.unselected, width: 0.4.w)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: ColorManger.redError, width: 0.4.w)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: ColorManger.redError, width: 0.4.w)),
      ));
}
