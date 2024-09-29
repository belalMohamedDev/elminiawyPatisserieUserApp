
import '../../../../../core/common/shared/shared_imports.dart'; //

class NewPasswordTextFormField extends StatelessWidget {
  const NewPasswordTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) => context
              .read<ForgetPasswordBloc>()
              .add(UserForgetNewPasswordEvent(value)),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          controller: context.read<ForgetPasswordBloc>().userNewPassword,
          obscureText: context.read<ForgetPasswordBloc>().showNewPassword,
          decoration: InputDecoration(
              prefixIcon: Icon(
                IconlyBroken.lock,
                size: 18.sp,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  context
                      .read<ForgetPasswordBloc>()
                      .add(const UserShowForgetNewPasswordEvent());
                },
                icon: context.read<ForgetPasswordBloc>().showNewPassword
                    ? Icon(
                        IconlyBroken.show,
                        size: 25.sp,
                      )
                    : Icon(
                        IconlyBroken.hide,
                        size: 25.sp,
                      ),
              ),
              hintText: AppStrings.enterYourPassword,
              errorText: state.whenOrNull(
                userNewPassword: (value) {
                  return value.isNotEmpty ? value : null;
                },
              )),
        );
      },
    );
  }
}
