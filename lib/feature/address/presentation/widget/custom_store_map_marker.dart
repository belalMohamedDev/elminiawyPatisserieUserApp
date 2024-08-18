import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/images/asset_manger.dart';

class TextOnImage extends StatelessWidget {
  final bool currentLocation;
  const TextOnImage({
    super.key,
    this.currentLocation = false,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        currentLocation ? ImageAsset.pickMarker : ImageAsset.storeLocation,
      ),
      height:  50.h ,
      width:  50.w,
    );
  }
}
