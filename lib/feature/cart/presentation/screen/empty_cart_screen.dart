import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/statsScreen/error_info.dart';
import '../../../../core/style/images/asset_manger.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    ImageAsset.noCart,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ErrorInfo(
                title: "Empty Cart!",
                description:
                    "It seems like you haven't added anything to your cart yet. Let's find some great items to fill it up!",
                // button: you can pass your custom button,
                //  btnText: "Discover Products",
                press: () {},
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

