import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../../core/common/toast/show_toast.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/style/color/color_manger.dart';
import '../../../../../core/style/fonts/font_manger.dart';
import '../../../../../core/style/fonts/strings_manger.dart';
import '../../../../../core/utils/app_regex.dart';
import '../../../../order/cubit/payment_cubit.dart';
import '../../../data/model/response/get_address_response.dart';
import '../../../logic/mapCubit/map_cubit.dart';
import '../../../logic/userAddressCubit/user_address_cubit.dart';

class AddAddressInformationFromTextFormField extends StatelessWidget {
  const AddAddressInformationFromTextFormField({
    super.key,
    required this.isPaymentAddress,
    required this.getAddressResponseData,
  });

  final bool? isPaymentAddress;
  final GetAddressResponseData? getAddressResponseData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAddressCubit, UserAddressState>(
      listener: (context, state) {
        state.whenOrNull(
            createNewAddressError: (statesCode, errorMessage) =>
                ShowToast.showToastErrorTop(
                    errorMessage: errorMessage, context: context),
            updateAddressError: (statesCode, errorMessage) =>
                ShowToast.showToastErrorTop(
                    errorMessage: errorMessage, context: context),
            createNewAddressSuccess: (data) {
              final userAddressCubit = context.read<UserAddressCubit>();

              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context);
              if (context.mounted) {
                userAddressCubit.clearAllControllers();

                context.read<MapCubit>().checkLocationAvailableResponse = null;

                context.read<MapCubit>().textEditingSearchText =
                    'Find Your Location';

                if (isPaymentAddress == true) {
                  final index = userAddressCubit.addressDataList
                      .indexWhere((element) => element.sId == data.data!.sId);

                  if (index != -1) {
                    context.read<PaymentCubit>().changeShippingIndex(index);
                    Navigator.pop(context);
                  }
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.address,
                  );
                }
              }
            },
            updateAddressSuccess: (data) {
              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context);
              if (context.mounted) {
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
            final mapCuibt = context.read<MapCubit>();

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
                          if (getAddressResponseData != null) {
                            await userAddressCubit.updateAddress(
                                id: getAddressResponseData!.sId!,
                                latitude:
                                    mapCuibt.targetPosition.latitude.toString(),
                                longitude: mapCuibt.targetPosition.longitude
                                    .toString(),
                                region: mapCuibt
                                    .checkLocationAvailableResponse!.address!);
                          } else {
                            await userAddressCubit.addNewAddress(
                                latitude:
                                    mapCuibt.targetPosition.latitude.toString(),
                                longitude: mapCuibt.targetPosition.longitude
                                    .toString(),
                                region: mapCuibt
                                    .checkLocationAvailableResponse!.address!);
                          }
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
                        updateAddressLoading: () => Row(
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
}
