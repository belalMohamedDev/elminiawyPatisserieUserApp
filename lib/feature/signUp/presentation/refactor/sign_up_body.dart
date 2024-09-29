
import '../../../../../core/common/shared/shared_imports.dart'; //


class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 60.h),
            child: Form(
              key: context.read<SignUpBloc>().signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.createAccount,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    AppStrings.fillYouInformation,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const NameTextFormField(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const EmailSignUpTextFormField(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const PasswordSignUpTextFormField(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const PhoneTextFormField(),
                  SizedBox(
                    height: 15.h,
                  ),
                  const AgreeWithTermsCondition(),
                  SizedBox(
                    height: 15.h,
                  ),
                  const SignUpButton(),
                  SizedBox(
                    height: 100.h,
                  ),
                  const AlreadyHaveAnAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
