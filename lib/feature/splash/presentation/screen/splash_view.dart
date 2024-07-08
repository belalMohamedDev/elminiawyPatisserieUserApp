import 'package:animate_do/animate_do.dart';
import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashBody());
  }
}

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Swing(
      infinite: true,
      // delay: Duration(seconds: 0),
      duration: const Duration(seconds: 3),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.asset(
                ImageAsset.splashImage,
                height: 180.h,
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Bounce(
              infinite: true,
              delay: const Duration(milliseconds: 750),
              duration: const Duration(milliseconds: 750),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  ImageAsset.splashImage,
                  height: 60.h,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Bounce(
              infinite: true,
              delay: const Duration(milliseconds: 750),
              duration: const Duration(milliseconds: 750),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  ImageAsset.splashImage,
                  height: 30.h,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Bounce(
              infinite: true,
              delay: const Duration(milliseconds: 750),
              duration: const Duration(milliseconds: 750),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  ImageAsset.splashImage,
                  height: 20.h,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Bounce(
              infinite: true,
              delay: const Duration(milliseconds: 750),
              duration: const Duration(milliseconds: 750),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  ImageAsset.splashImage,
                  height: 10.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
