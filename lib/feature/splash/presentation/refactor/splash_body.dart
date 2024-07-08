// import 'package:altayer/core/style/images/asset_manger.dart';
// import 'package:altayer/core/style/color/color_manger.dart';
// import 'package:altayer/feature/splash/logic/splash_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:lottie/lottie.dart';

// class SplashBody extends StatelessWidget {
//   const SplashBody({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SplashController>(
//       init: SplashController(),
//       builder: (controller) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//                 child: Lottie.asset(
//               JsonAsset.splashLogo,
//               width: controller.animation.value * 280.w,
//               height: controller.animation.value * 280.h,
//             )),
//             SizedBox(
//               height: 130.h,
//             ),
//             SpinKitFadingCircle(color: ColorManger.primary, size: 25.0.sp)
//           ],
//         );
//       },
//     );
//   }
// }
