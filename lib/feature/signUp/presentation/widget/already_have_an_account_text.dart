import '../../../../../core/common/shared/shared_imports.dart'; //


class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
            text: AppStrings.alreadyHaveAccount,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14.sp,
                ),
            children: [
              WidgetSpan(
                  child: SizedBox(
                width: 10.w,
              )),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pushReplacementNamed(Routes.loginRoute);
                    },
                  text: AppStrings.signIn,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 18.sp,
                      fontFamily: FontConsistent.fontFamilyAcme))
            ]),
        style: Theme.of(context).textTheme.bodyLarge);
  }
}
