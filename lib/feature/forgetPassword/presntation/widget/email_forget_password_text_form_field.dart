import '../../../../../core/common/shared/shared_imports.dart'; //


class EmailForgetPasswordTextFormField extends StatelessWidget {
  const EmailForgetPasswordTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) => context
              .read<ForgetPasswordBloc>()
              .add(UserForgetPasswordEmailAddressEvent(value)),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isEmailValid(value)) {
              return AppStrings.isEmailValid;
            }
            return null;
          },
          controller: context
              .read<ForgetPasswordBloc>()
              .userForgetPasswordEmailAddress,
          decoration: InputDecoration(
              prefixIcon: Icon(
                IconlyBroken.message,
                size: 18.sp,
              ),
              hintText: AppStrings.emailExample,
              errorText: state.whenOrNull(
                userForgetEmailAddress: (value) {
                  return value.isNotEmpty ? value : null;
                },
              )),
        );
      },
    );
  }
}
