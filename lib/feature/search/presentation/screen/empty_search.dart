import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/statsScreen/error_info.dart';
import '../../../../core/style/images/asset_manger.dart';

class EmptySearchScreen extends StatelessWidget {
  const EmptySearchScreen({super.key});

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
                height: 40.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    ImageAsset.noSearch,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const ErrorInfo(
                title: "No Results Found!",
                description:
                    "We couldn't find any matching results for your search. Please try again with different keywords.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
