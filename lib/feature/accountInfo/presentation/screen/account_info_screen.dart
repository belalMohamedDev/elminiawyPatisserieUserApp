import 'package:elminiawy/core/utils/extensions.dart';
import 'package:elminiawy/feature/accountInfo/cubit/account_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/fonts/strings_manger.dart';

class AccountInfomation extends StatefulWidget {
  const AccountInfomation({super.key});

  @override
  State<AccountInfomation> createState() => _AccountInfomationState();
}

class _AccountInfomationState extends State<AccountInfomation> {
  @override
  void initState() {
    super.initState();
    context.read<AccountInformationCubit>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("       My Account Information",
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
        actions: [
          InkWell(
            onTap: () {
              context.read<AccountInformationCubit>().enablTextFormField();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 18.w),
              child: Text("Edit",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.primary,
                      fontSize: 15.sp)),
            ),
          )
        ],
      ),
      body: const AccountInfomationBody(),
    );
  }
}

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

  Column _accountInformationTextFormField(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: TextFormField(
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
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 50.h,
          child: TextFormField(
            style: TextStyle(
                color:
                    context.read<AccountInformationCubit>().isTextFormFieldEnabl
                        ? ColorManger.brun
                        : ColorManger.brunLight),
            controller:
                context.read<AccountInformationCubit>().userNameController,
            enabled:
                context.read<AccountInformationCubit>().isTextFormFieldEnabl,
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
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 50.h,
          child: TextFormField(
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
        ),
      ],
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
            });
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
                context
                    .read<AccountInformationCubit>()
                    .updateAccountInformation();
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
