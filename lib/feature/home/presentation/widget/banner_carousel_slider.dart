import '../../../../../core/common/shared/shared_imports.dart'; //

class BannerCarouselSlider extends StatelessWidget {
  const BannerCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<BannerCubit, BannerState>(
      buildWhen: (previous, current) =>
          current is GetBannersLoading ||
          current is GetBannersSuccess ||
          current is GetBannersError,
      builder: (context, state) {
        if (state is GetBannersSuccess) {
          return _bannersSuccessState(state, responsive);
        }
        return Center(
          child: LoadingShimmer(
            height: responsive.setHeight(15),
            width: double.infinity,
            borderRadius: responsive.setBorderRadius(2),
          ),
        );
      },
    );
  }

  CarouselSlider _bannersSuccessState(
      GetBannersSuccess state, ResponsiveUtils responsive) {
    return CarouselSlider(
      options: CarouselOptions(
          height: responsive.setHeight(15),
          enableInfiniteScroll: true,
          autoPlay: true,
          viewportFraction: 1.1,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.easeInOutCubic,
          scrollDirection: Axis.horizontal),
      items: state.data.data!
          .map((banner) => ClipRRect(
                borderRadius:
                    BorderRadius.circular(responsive.setBorderRadius(2)),
                child: CachedNetworkImage(
                  imageUrl: banner.image!,
                  width: responsive.setWidth(89),
                  fit: BoxFit.fill,
                  placeholder: (context, url) => LoadingShimmer(
                    height: responsive.setHeight(15),
                    width: responsive.setWidth(89),
                    borderRadius: responsive.setBorderRadius(2),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ))
          .toList(),
    );
  }
}
