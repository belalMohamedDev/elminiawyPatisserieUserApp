import 'package:elminiawy/core/common/shared/shared_imports.dart';

class ShippingAddressBody extends StatefulWidget {
  const ShippingAddressBody({super.key});

  @override
  State<ShippingAddressBody> createState() => _ShippingAddressBodyState();
}

class _ShippingAddressBodyState extends State<ShippingAddressBody> {
  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    final responsive = ResponsiveUtils(context);
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    return Padding(
      padding: responsive.setPadding(top: 3, right: 6, left: 6, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CheckOutProcessing(screenIndex: 1),
          responsive.setSizeBox(height: 3),
          _changingAddressText(context, responsive),
          responsive.setSizeBox(height: 2),
          Text(
            context.translate(AppStrings.currentLocation),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: responsive.setTextSize(4),
            ),
          ),
          responsive.setSizeBox(height: 2),
          _mapWidget(context, responsive),
          responsive.setSizeBox(height: 2),
          Text(
            context.translate(AppStrings.shippingAddress),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: responsive.setTextSize(4),
            ),
          ),
          responsive.setSizeBox(height: 2),
          BlocBuilder<UserAddressCubit, UserAddressState>(
            builder: (context, state) {
              final userAddressCubit = context.read<UserAddressCubit>();
              return Expanded(
                child: ListView.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: userAddressCubit.addressDataList.length + 1,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    if (index == userAddressCubit.addressDataList.length) {
                      return Padding(
                        padding: responsive.setPadding(bottom: 1, top: 0.5),
                        child: InkWell(
                          onTap: () {
                            context.read<UserAddressCubit>().isPaymentAddress =
                                true;

                            Navigator.of(
                              context,
                              rootNavigator: !false,
                            ).popAndPushNamed(Routes.map);
                          },
                          child: Container(
                            width: double.infinity,
                            height: responsive.setHeight(6),
                            decoration: BoxDecoration(
                              color: ColorManger.backgroundItem,
                              borderRadius: BorderRadius.circular(
                                responsive.setBorderRadius(2),
                              ),
                              border: Border.all(
                                color: ColorManger.brownLight,
                                width: responsive.setWidth(0.1),
                              ),
                            ),
                            child: Padding(
                              padding: responsive.setPadding(
                                left: isEnLocale ? 2 : 0,
                                right: isEnLocale ? 0 : 2,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: ColorManger.brun,
                                  ),
                                  responsive.setSizeBox(width: 2),

                                  Expanded(
                                    child: Text(
                                      context.translate(
                                        AppStrings.addNewAddress,
                                      ),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,

                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontSize: responsive.setTextSize(
                                              3.5,
                                            ),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: responsive.setPadding(bottom: 1),
                        child: InkWell(
                          onTap: () {
                            userAddressCubit.changeBetweenAddress(index);
                          },
                          child: Container(
                            width: double.infinity,
                            height: responsive.setHeight(6),
                            decoration: BoxDecoration(
                              color: userAddressCubit.addressIndex == index
                                  ? ColorManger.brownLight
                                  : ColorManger.backgroundItem,
                              borderRadius: BorderRadius.circular(
                                responsive.setBorderRadius(2),
                              ),
                              border: Border.all(
                                color: ColorManger.brownLight,
                                width: responsive.setWidth(0.1),
                              ),
                            ),
                            child: Padding(
                              padding: responsive.setPadding(
                                left: isEnLocale ? 2 : 0,
                                right: isEnLocale ? 0 : 2,
                              ),
                              child: RadioGroup<int>(
                                groupValue: userAddressCubit.addressIndex,
                                onChanged: (value) {
                                  userAddressCubit.changeBetweenAddress(value!);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      IconlyBold.location,
                                      color: ColorManger.brun,
                                    ),

                                    responsive.setSizeBox(width: 2),

                                    Expanded(
                                      child: Text(
                                        userAddressCubit
                                            .addressDataList[index]
                                            .region!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: responsive.setTextSize(
                                                3.5,
                                              ),
                                            ),
                                      ),
                                    ),

                                    Radio<int>(
                                      value: index,
                                      activeColor: ColorManger.brun,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),

          CustomButton(
            onPressed: () {
              context.pushNamed(Routes.shippingPayment);
            },
            widget: Text(
              context.translate(AppStrings.saveAndContinue),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: responsive.setTextSize(3.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BlocBuilder _mapWidget(BuildContext context, ResponsiveUtils responsive) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        final mapCuibt = context.read<MapCubit>();

        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                responsive.setBorderRadius(1.4),
              ),
              child: SizedBox(
                height: responsive.setHeight(12),
                width: double.infinity,
                child: CustomGoogleMapMarkerBuilder(
                  customMarkers: mapCuibt.markers,
                  builder: (p0, Set<Marker>? markers) {
                    return GoogleMap(
                      onMapCreated: (controller) =>
                          mapCuibt.setCheckOutMapController(controller),
                      zoomControlsEnabled: false,
                      initialCameraPosition: CameraPosition(
                        target: mapCuibt.targetPosition,
                        zoom: 12,
                      ),
                      markers: markers ?? {},
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: responsive.setHeight(1),
              right: responsive.setWidth(28),
              child: Container(
                height: responsive.setHeight(4),
                width: responsive.setWidth(30),
                decoration: BoxDecoration(
                  color: ColorManger.white,
                  borderRadius: BorderRadius.circular(
                    responsive.setBorderRadius(1.4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(IconlyBold.location, color: ColorManger.brunLight),
                    responsive.setSizeBox(width: 1.2),
                    Text(
                      context.translate(AppStrings.youreHere),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: responsive.setTextSize(3.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Container _changingAddressText(
    BuildContext context,
    ResponsiveUtils responsive,
  ) {
    return Container(
      height: responsive.setHeight(3),
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        children: [
          responsive.setSizeBox(width: 4),
          Icon(IconlyBroken.buy, color: ColorManger.brunLight),
          responsive.setSizeBox(width: 3),
          Text(
            context.translate(AppStrings.changingTheAddressMightAffectYourCart),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: responsive.setTextSize(3.5),
            ),
          ),
        ],
      ),
    );
  }
}
