import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/loading/loading_shimmer.dart';
import '../../logic/bannerCubit/banner_cubit.dart';

class BannerCarouselSlider extends StatelessWidget {
  const BannerCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      buildWhen: (previous, current) =>
          current is GetBannersLoading ||
          current is GetBannersSuccess ||
          current is GetBannersError,
      builder: (context, state) {
        if (state is GetBannersSuccess) {
          return _bannersSuccessState(state);
        }
        return Padding(
          padding: EdgeInsets.only(left: 17.w),
          child: LoadingShimmer(
            height: 130.h,
            width: 300.w,
            borderRadius: 12.r,
          ),
        );
      },
    );
  }

  CarouselSlider _bannersSuccessState(GetBannersSuccess state) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 130.h,
          enableInfiniteScroll: true,
          autoPlay: true,
          viewportFraction: 1.1,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.easeInOutCubic,
          scrollDirection: Axis.horizontal),
      items: state.data.data!
          .map((banner) => ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: banner.image!,
                  width: 300.w,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => LoadingShimmer(
                    height: 130.h,
                    width: 300.w,
                    borderRadius: 12.r,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ))
          .toList(),
    );
  }
}
