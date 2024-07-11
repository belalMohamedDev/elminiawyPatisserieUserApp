import 'package:elminiawy/core/style/fonts/strings_manger.dart';
import 'package:elminiawy/feature/login/presentation/widget/dont_have_account_text.dart';
import 'package:elminiawy/feature/login/presentation/widget/email_login_text_form_field.dart';
import 'package:elminiawy/feature/login/presentation/widget/or_sign_in_with_text.dart';
import 'package:elminiawy/feature/login/presentation/widget/password_login_text_form_field.dart';
import 'package:elminiawy/feature/login/presentation/widget/sign_in_button.dart';
import 'package:elminiawy/feature/login/presentation/widget/sign_in_with_apple_face_book_and_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    //   context.pushReplacementNamed(Routes.forgetPasswordRoute);
                  },
                  child: Text(
                    AppStrings.forgetPassword,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const SignInButton(),
              SizedBox(
                height: 50.h,
              ),
              const OrSignInWithText(),
              SizedBox(
                height: 45.h,
              ),
              const SignInWithAppleFaceBookAndGoogleButton(),
              SizedBox(
                height: 40.h,
              ),
              const DontHaveAnAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
