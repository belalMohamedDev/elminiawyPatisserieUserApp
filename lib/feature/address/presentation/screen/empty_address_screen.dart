import 'package:elminiawy/feature/address/presentation/screen/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/sharedWidget/error_info.dart';
import '../../../../core/style/images/asset_manger.dart';
import '../../../../core/utils/persistent_nav_bar_navigator.dart.dart';

class EmptyAddressScreen extends StatelessWidget {
  const EmptyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    ImageAsset.noAddress,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ErrorInfo(
                title: "Empty Address!",
                description:
                    "It seems like you haven't added any addresses yet. Please add an address to proceed with your order!",
                btnText: "Add Address",
                press: () {
                  NavBarNavigator.push(context,
                      screen: const MapScreen(), withNavBar: false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
