
import '../../../../../core/common/shared/shared_imports.dart'; //

class ConfirmNewPasswordTextFormField extends StatelessWidget {
  const ConfirmNewPasswordTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.confirmPassword,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              onChanged: (value) => context
                  .read<ForgetPasswordBloc>()
                  .add(UserConfirmForgetNewPasswordEvent(value)),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              controller:
                  context.read<ForgetPasswordBloc>().userConfirmNewPassword,
              obscureText:
                  context.read<ForgetPasswordBloc>().showConfirmNewPassword,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    IconlyBroken.lock,
                    size: 18.sp,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      context
                          .read<ForgetPasswordBloc>()
                          .add(const UserShowConfirmForgetNewPasswordEvent());
                    },
                    icon: context
                            .read<ForgetPasswordBloc>()
                            .showConfirmNewPassword
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
                    userConfirmNewPassword: (value) {
                      return value.isNotEmpty ? value : null;
                    },
                  )),
            )
          ],
        );
      },
    );
  }
}