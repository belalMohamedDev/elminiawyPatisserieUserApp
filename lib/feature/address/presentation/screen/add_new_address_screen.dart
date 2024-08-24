import 'package:country_code_picker/country_code_picker.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/fonts/strings_manger.dart';
import '../../../../core/utils/app_regex.dart';
import '../../logic/userAddressCubit/user_address_cubit.dart';

class AddNewAddressScreen extends StatelessWidget {
  final LatLng latLng;
  final List<MarkerData> markerData;
  final String addressAreaInformation;
  const AddNewAddressScreen(
      {super.key,
      required this.latLng,
      required this.markerData,
      required this.addressAreaInformation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Address",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: AddNewAddressBody(
        latLng: latLng,
        markerData: markerData,
        addressAreaInformation: addressAreaInformation,
      ),
    );
  }
}

class AddNewAddressBody extends StatelessWidget {
  final LatLng latLng;
  final List<MarkerData> markerData;
  final String addressAreaInformation;

  const AddNewAddressBody({
    super.key,
    required this.latLng,
    required this.markerData,
    required this.addressAreaInformation,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _mapWidget(context, latLng, markerData),
            SizedBox(
              height: 10.h,
            ),
            _cardArea(context, addressAreaInformation),
            SizedBox(
              height: 15.h,
            ),
            _regionAreaRow(context),
            SizedBox(
              height: 15.h,
            ),
            _addressTextFormField(context, latLng, addressAreaInformation),
          ],
        ),
      ),
    );
  }

  BlocConsumer _addressTextFormField(
      BuildContext context, LatLng latLng, String addressAreaInformation) {
    return BlocConsumer<UserAddressCubit, UserAddressState>(
      listener: (context, state) {
        state.whenOrNull(
            createNewAddressError: (statesCode, errorMessage) =>
                ShowToast.showToastErrorTop(
                    errorMessage: errorMessage, context: context),
            createNewAddressSuccess: (data) {
              final userAddressCubit = context.read<UserAddressCubit>();

              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context);
              if (context.mounted) {
                userAddressCubit.clearAllControllers();

                Navigator.pushReplacementNamed(
                  context,
                  Routes.address,
                );
              }
            });
      },
      builder: (context, state) {
        return BlocBuilder<UserAddressCubit, UserAddressState>(
          builder: (context, state) {
            final userAddressCubit = context.read<UserAddressCubit>();

            return Form(
              key: userAddressCubit.formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isNameValid(value)) {
                        return 'Please enter a valid building name';
                      }
                      return null;
                    },
                    controller: userAddressCubit.buildingNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: userAddressCubit.regionAreaIndex == 1
                          ? "House"
                          : "Building name",
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  userAddressCubit.regionAreaIndex == 1
                      ? const SizedBox()
                      : Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: userAddressCubit.companyController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return userAddressCubit.regionAreaIndex == 2
                                        ? 'Please enter a valid company'
                                        : 'Please enter a valid apt .no.';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText:
                                      userAddressCubit.regionAreaIndex == 2
                                          ? "Company"
                                          : "Apt. no.",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: userAddressCubit.floorController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: 'Floor (optional)',
                                ),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: userAddressCubit.streetController,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isNameValid(value)) {
                        return 'Please enter a valid street name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Street",
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: userAddressCubit.additionalDirectionsContoller,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Additional directions (optional)',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: userAddressCubit.phoneNumberContoller,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isPhoneNumberValid(value)) {
                        return 'Please enter a valid phone';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      prefixIcon: CountryCodePicker(
                        showFlagMain: false,
                        onChanged: (value) {},
                        textStyle: TextStyle(color: ColorManger.black26),
                        initialSelection: '+20',
                        favorite: const ['+20', '+39', 'FR', '+966'],
                        flagWidth: 20.r,
                        flagDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r)),
                        dialogBackgroundColor: ColorManger.white,
                        closeIcon: Icon(
                          Icons.close_rounded,
                          color: ColorManger.black54,
                        ),
                        showDropDownButton: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: userAddressCubit.addressLabel,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Address label (optional)",
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 8.w, top: 10.h, bottom: 10.h),
                    child: Text(
                        "Give this address a label so you can easily choose between them (e.g. Parent's home)",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: FontConsistent.fontFamilyAcme,
                            color: ColorManger.brunLight,
                            fontSize: 10.sp)),
                  ),
                  CustomButton(
                      onPressed: () async {
                        if (userAddressCubit.formKey.currentState!.validate()) {
                          await userAddressCubit.addNewAddress(
                              addressAreaInformation,
                              '${latLng.latitude}',
                              '${latLng.longitude}');
                        }
                      },
                      widget: state.maybeWhen(
                        createNewAddressLoading: () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                                strokeAlign: 0.01,
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              AppStrings.loading,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontSize: 16.sp,
                                      color: ColorManger.white,
                                      fontWeight: FontWeightManger.semiBold),
                            ),
                          ],
                        ),
                        orElse: () => Text(
                          "Save address",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: 16.sp,
                                  color: ColorManger.white,
                                  fontWeight: FontWeightManger.semiBold),
                        ),
                      ))
                ],
              ),
            );
          },
        );
      },
    );
  }

  SizedBox _regionAreaRow(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: BlocBuilder<UserAddressCubit, UserAddressState>(
        builder: (context, state) {
          return ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: context.read<UserAddressCubit>().regionArea.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 8.w),
                  child: InkWell(
                    onTap: () {
                      context.read<UserAddressCubit>().changeRegionAreaIndex(
                          index: index,
                          alias: context
                              .read<UserAddressCubit>()
                              .regionArea[index]["text"]);
                    },
                    child: RegionAreaWidget(
                      index: index,
                      imagePath: context
                          .read<UserAddressCubit>()
                          .regionArea[index]["imagePath"],
                      text: context.read<UserAddressCubit>().regionArea[index]
                          ["text"],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  Card _cardArea(BuildContext context, String addressAreaInformation) {
    return Card(
      elevation: 1.8,
      shadowColor: ColorManger.brownLight,
      child: Container(
        height: 55.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: ColorManger.white,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                    top: 12.h,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        IconlyBold.location,
                        size: 18.sp,
                        color: ColorManger.brun,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text("Area",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.brun,
                                  fontSize: 12.sp)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 5.h),
                  child: Text(addressAreaInformation,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brunLight,
                          fontSize: 10.sp)),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 20.w, top: 2.h),
              child: InkWell(
                onTap: () {},
                child: Text("Change",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brun,
                        fontSize: 13.sp)),
              ),
            )
          ],
        ),
      ),
    );
  }

  ClipRRect _mapWidget(
      BuildContext context, LatLng latLng, List<MarkerData> markerData) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: SizedBox(
          height: 100.h,
          width: double.infinity,
          child: CustomGoogleMapMarkerBuilder(
            customMarkers: markerData,
            builder: (p0, Set<Marker>? markers) {
              return GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(target: latLng, zoom: 13),
                markers: markers ?? {},
              );
            },
          ),
        ));
  }
}

class RegionAreaWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final int index;
  const RegionAreaWidget({
    super.key,
    required this.imagePath,
    required this.index,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    bool regionAreaIndex =
        context.read<UserAddressCubit>().regionAreaIndex == index;
    return Container(
      height: 32.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: regionAreaIndex ? ColorManger.brun : null,
        borderRadius: BorderRadius.circular(8.r),
        border: regionAreaIndex
            ? null
            : Border.all(
                color: ColorManger.brownLight,
                width: 0.5.w,
              ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            color: regionAreaIndex ? ColorManger.white : null,
            height: 14.h,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: regionAreaIndex ? ColorManger.white : null,
                  fontSize: 12.sp)),
        ],
      ),
    );
  }
}
