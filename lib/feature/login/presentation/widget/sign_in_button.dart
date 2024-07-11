import 'package:elminiawy/core/common/sharedWidget/custom_button.dart';
import 'package:elminiawy/core/style/color/color_manger.dart';
import 'package:elminiawy/core/style/fonts/font_manger.dart';
import 'package:elminiawy/core/style/fonts/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      widget: Text(
        AppStrings.signIn,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 15.sp,
            color: ColorManger.white,
            fontWeight: FontWeightManger.semiBold),
      ),
    );

    ///////////
    // return BlocConsumer<LoginBloc, LoginState>(
    //   listener: (context, state) {
    //     state.whenOrNull(
    //         error: (statesCode, errorMessage) => ShowToast.showToastErrorTop(
    //             errorMessage: errorMessage, context: context),
    //         suceess: (data) {
    //           ShowToast.showToastSuccessTop(
    //               message: data.message!, context: context);
    //           context.pushReplacementNamed(Routes.home);
    //         });
    //   },
    //   builder: (context, state) {
    //     return CustomButton(
    //       onPressed: context.read<LoginBloc>().isButtonInVaildator
    //           ? () {
    //               context.read<LoginBloc>().add(const UserLoginButton());
    //             }
    //           : null,
    //       widget: state.maybeWhen(
    //         loading: () => Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             SizedBox(
    //               height: 20.h,
    //               width: 20.w,
    //               child: const CircularProgressIndicator(
    //                 color: Colors.white,
    //                 strokeWidth: 2.0,
    //                 strokeAlign: 0.01,
    //               ),
    //             ),
    //             SizedBox(
    //               width: 15.w,
    //             ),
    //             Text(
    //               AppStrings.loading,
    //               style: Theme.of(context).textTheme.titleLarge?.copyWith(
    //                   fontSize: 14.sp, fontWeight: FontWeightManger.semiBold),
    //             ),
    //           ],
    //         ),
    //         orElse: () => Text(
    //           AppStrings.signIn,
    //           style: Theme.of(context).textTheme.titleLarge?.copyWith(
    //               fontSize: 14.sp, fontWeight: FontWeightManger.semiBold),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
