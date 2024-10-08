import '../../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class AddAddressInformationFromTextFormField extends StatelessWidget {
  const AddAddressInformationFromTextFormField({
    super.key,
    required this.getAddressResponseData,
  });

  final GetAddressResponseData? getAddressResponseData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAddressCubit, UserAddressState>(
      listener: (context, state) {
        state.whenOrNull(
            createNewAddressError: (apiErrorModel) =>
                ShowToast.showToastErrorTop(
                    errorMessage: apiErrorModel.message!, context: context),
            updateAddressError: (apiErrorModel) => ShowToast.showToastErrorTop(
                errorMessage: apiErrorModel.message!, context: context),
            createNewAddressSuccess: (data) {
              final userAddressCubit = context.read<UserAddressCubit>();

              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context);
              if (context.mounted) {
                userAddressCubit.clearAllControllers();

                context.read<MapCubit>().checkLocationAvailableResponse = null;

                context.read<MapCubit>().textEditingSearchText =
                  AppStrings.findYourLocation;

                if (userAddressCubit.isPaymentAddress == true) {
                  final index = userAddressCubit.addressDataList
                      .indexWhere((element) => element.sId == data.data!.sId);

                  if (index != -1) {
                    context.read<PaymentCubit>().changeShippingIndex(index);
                    Navigator.of(context, rootNavigator: !false)
                        .popAndPushNamed(Routes.shippingAddress);
                  }
                } else {
                  Navigator.pop(context);
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
                        return AppStrings.pleaseEnterAValidBuildingName;
                      }
                      return null;
                    },
                    controller: userAddressCubit.buildingNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: userAddressCubit.regionAreaIndex == 1
                          ? AppStrings.house
                          : AppStrings.buildingName ,
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
                                        ? AppStrings.pleaseEnterAValidCompany
                                        : AppStrings.pleaseEnterAValidApt;
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText:
                                      userAddressCubit.regionAreaIndex == 2
                                          ? AppStrings.company
                                          : AppStrings.aptNo,
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
                                  hintText: AppStrings.floorOptional,
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
                        return AppStrings.pleaseEnterAValidStreetName;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: AppStrings.street,
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
                      hintText: AppStrings.additionalDirectionsOptional,
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
                        return AppStrings.pleaseEnterAValidPhoneNumber;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText:AppStrings.phoneNumber ,
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
                      hintText: AppStrings.addressLabelOptional,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 8.w, top: 10.h, bottom: 10.h),
                    child: Text(
                       AppStrings.givethisAddress,
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
                                region: mapCuibt.checkLocationAvailableResponse!
                                        .address ??
                                    '');
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
                                  .headlineSmall
                                  ?.copyWith(
                                      fontSize: 16.sp,
                                   ),
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
                                  .headlineSmall
                                  ?.copyWith(
                                      fontSize: 16.sp,
                                 ),
                            ),
                          ],
                        ),
                        orElse: () => Text(
                          AppStrings.saveAddress,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontSize: 16.sp,
                                 ),
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
