
import '../../../../../core/common/shared/shared_imports.dart'; //



class VerificationCodeBody extends StatelessWidget {
  const VerificationCodeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 50.h),
        child: Column(
          children: [
            Text(
              AppStrings.verifyCode,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              AppStrings.pleaseEnterTheCode,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              context
                  .read<ForgetPasswordBloc>()
                  .userForgetPasswordEmailAddress
                  .text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60.h,
            ),
            const VerifyCodeTextFormField(),
            SizedBox(
              height: 50.h,
            ),
            Text(
              AppStrings.didntRecieveotp,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 14.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  context
                      .read<ForgetPasswordBloc>()
                      .add(const UserForgetPasswordButtonEvent());
                },
                child: Text(
                  AppStrings.resendCode,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14.sp,
                        // decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            const VerificationCodeButton(),
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  context.pushReplacementNamed(Routes.loginRoute);
                  context
                      .read<ForgetPasswordBloc>()
                      .userForgetPasswordEmailAddress
                      .clear();
                },
                child: Text(
                  AppStrings.backToLogin,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
