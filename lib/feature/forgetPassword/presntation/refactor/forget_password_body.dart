

import '../../../../../core/common/shared/shared_imports.dart'; //

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, top: 120.h, right: 25.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              AppStrings.restYourPassword,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              AppStrings.enterYourEmailToSendVerifyCode,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 80.h,
            ),
            const EmailForgetPasswordTextFormField(),
            SizedBox(
              height: 40.h,
            ),
            const ForgetPasswordButton(),
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
