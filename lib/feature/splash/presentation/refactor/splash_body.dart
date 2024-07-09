
import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAsset.splashImage,
    );
  }
}
