import '../../../../../core/common/shared/shared_imports.dart'; //


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.signIn,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                AppStrings.hiWelcomeBack,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 60.h,
              ),
              const EmailLoginTextFormField(),
              SizedBox(
                height: 18.h,
              ),
              const PasswordLoginTextFormField(),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                     context.pushReplacementNamed(Routes.forgetPasswordRoute);
                  },
                  child: Text(
                    AppStrings.forgetPassword,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const SignInButton(),
              SizedBox(
                height: 60.h,
              ),
              const OrSignInWithText(),
              SizedBox(
                height: 45.h,
              ),
              const SignInWithAppleFaceBookAndGoogleButton(),
              SizedBox(
                height: 65.h,
              ),
              const DontHaveAnAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
