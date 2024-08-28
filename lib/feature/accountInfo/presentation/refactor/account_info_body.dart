import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/application/cubit/app_logic_cubit.dart';
import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/services/shared_pref_helper.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/fonts/strings_manger.dart';
import '../../../../core/utils/app_regex.dart';
import '../../cubit/account_information_cubit.dart';

class AccountInfomationBody extends StatelessWidget {
  const AccountInfomationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountInformationCubit, AccountInformationState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
          child: Column(
            children: [
              _accountInformationTextFormField(context),
              SizedBox(
                height: 30.h,
              ),
              _accountInformationButton(context)
            ],
          ),
        );
      },
    );
  }

  Form _accountInformationTextFormField(BuildContext context) {
    return Form(
      key: context.read<AccountInformationCubit>().formKey,
      child: Column(
        children: [
          TextFormField(
            enabled: false,
            decoration: InputDecoration(
              hintText: context.read<AccountInformationCubit>().userEmail,
              prefixIcon: Icon(IconlyBroken.message,
                  size: 18.sp, color: ColorManger.brunLight),
              hintStyle: TextStyle(color: ColorManger.brunLight),
              fillColor: ColorManger.backgroundItem,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.backgroundItem,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            style: TextStyle(
                color:
                    context.read<AccountInformationCubit>().isTextFormFieldEnabl
                        ? ColorManger.brun
                        : ColorManger.brunLight),
            controller:
                context.read<AccountInformationCubit>().userNameController,
            enabled:
                context.read<AccountInformationCubit>().isTextFormFieldEnabl,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isNameValid(value)) {
                return 'Please enter a valid name';
              }
              return null;
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.backgroundItem,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.backgroundItem,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              ),
              prefixIcon: Icon(IconlyBroken.profile,
                  size: 18.sp, color: ColorManger.brunLight),
              fillColor: ColorManger.backgroundItem,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.backgroundItem,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            controller:
                context.read<AccountInformationCubit>().userPhoneController,
            enabled:
                context.read<AccountInformationCubit>().isTextFormFieldEnabl,
            style: TextStyle(
                color:
                    context.read<AccountInformationCubit>().isTextFormFieldEnabl
                        ? ColorManger.brun
                        : ColorManger.brunLight),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.backgroundItem,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.backgroundItem,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              ),
              prefixIcon: Icon(IconlyBroken.call,
                  size: 18.sp, color: ColorManger.brunLight),
              fillColor: ColorManger.backgroundItem,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.backgroundItem,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BlocConsumer _accountInformationButton(BuildContext context) {
    return BlocConsumer<AccountInformationCubit, AccountInformationState>(
      listener: (context, state) {
        state.whenOrNull(
          updateAccountInformationError: (statesCode, errorMessage) =>
              ShowToast.showToastErrorTop(
                  errorMessage: errorMessage, context: context),
          updateAccountInformationSuccess: (data) {
            ShowToast.showToastSuccessTop(
                message: data.message!, context: context);

            context.read<AccountInformationCubit>().getUserInfo();
            context.read<AccountInformationCubit>().enablTextFormField();
          },
          deleteAccountSuccess: (data) async {
            ShowToast.showToastSuccessTop(
                message: data.message!, context: context);
            await SharedPrefHelper.clearAllSecuredData();
            if (context.mounted) {
              Navigator.of(context, rootNavigator: !false)
                  .pushNamedAndRemoveUntil(
                      Routes.loginRoute, (Route route) => false);

              context.read<AppLogicCubit>().bottomNavBarController.jumpToTab(0);
            }
          },
          deleteAccountError: (statesCode, errorMessage) =>
              ShowToast.showToastErrorTop(
                  errorMessage: errorMessage, context: context),
        );
      },
      builder: (context, state) {
        return Container(
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color:
                  context.read<AccountInformationCubit>().isTextFormFieldEnabl
                      ? ColorManger.brun
                      : ColorManger.redError.withAlpha(200)),
          child: TextButton(
            onPressed: () {
              if (context
                      .read<AccountInformationCubit>()
                      .isTextFormFieldEnabl ==
                  true) {
                if (context
                    .read<AccountInformationCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  context
                      .read<AccountInformationCubit>()
                      .updateAccountInformation();
                }
              } else {
                context.read<AccountInformationCubit>().summitdeleteAccount();
              }
            },
            child: state.maybeWhen(
              updateAccountInformationLoading: () => Row(
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
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16.sp,
                        color: ColorManger.white,
                        fontWeight: FontWeightManger.semiBold),
                  ),
                ],
              ),
              deleteAccountLoading: () => Row(
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
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16.sp,
                        color: ColorManger.white,
                        fontWeight: FontWeightManger.semiBold),
                  ),
                ],
              ),
              orElse: () => Text(
                context.read<AccountInformationCubit>().isTextFormFieldEnabl
                    ? "Save"
                    : "Delete account",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16.sp,
                    color: ColorManger.white,
                    fontWeight: FontWeightManger.semiBold),
              ),
            ),
          ),
        );
      },
    );
  }
}
