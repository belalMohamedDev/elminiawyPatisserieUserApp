import 'package:elminiawy/core/common/loading/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridViewLoadingState extends StatelessWidget {
  final ScrollPhysics? physics;

  const ProductGridViewLoadingState({
    super.key,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        physics: physics,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.75,
        children: List.generate(
            8,
            (index) => LoadingShimmer(
                  height: 280.h,
                  width: 153.375.w,
                  borderRadius: 12.r,
                )));
  }
}
