import '../../../../../core/common/shared/shared_imports.dart'; //


class VerifyCodeTextFormField extends StatelessWidget {
  const VerifyCodeTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VerificationCode(
      textStyle:
          Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18.sp),
      keyboardType: TextInputType.text,
      underlineColor: ColorManger.primary,
      fullBorder: true,
      margin: const EdgeInsets.all(2),
      length: 6,
      itemSize: 40.spMax,
      cursorColor: ColorManger.primary,
      onCompleted: (String value) {
        context
            .read<ForgetPasswordBloc>()
            .add(UserForgetPasswordOTPButtonEvent(value));
      },
      onEditing: (bool value) {},
    );
  }
}
