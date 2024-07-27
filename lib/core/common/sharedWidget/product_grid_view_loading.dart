import 'package:elminiawy/core/common/loading/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductGridViewLoadingState extends StatelessWidget {

  const ProductGridViewLoadingState({
    super.key,
 
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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
