import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/style/color/color_manger.dart';
import '../../../../../core/style/images/asset_manger.dart';
import '../../../logic/mapCubit/map_cubit.dart';

class CurrentLocationButton extends StatelessWidget {
  const CurrentLocationButton({
    super.key, required this.mapCubit,
  });
  final MapCubit mapCubit;

  @override
  Widget build(BuildContext context) {

    return Positioned(
      bottom: 165.h,
      right: 25.w,
      child: InkWell(
        onTap: () {
          mapCubit.getCurrentLocation(context).then(
            (value) {
              context
                  .read<MapCubit>()
                  .checkAddressAvailableFetch(mapCubit.targetPosition);
            },
          );
        },
        child: CircleAvatar(
          maxRadius: 22.r,
          backgroundColor: ColorManger.brown,
          child: Image.asset(
            ImageAsset.navigation,
            height: 20.h,
          ),
        ),
      ),
    );
  }
}
