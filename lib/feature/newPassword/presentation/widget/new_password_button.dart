
import '../../../../../core/common/shared/shared_imports.dart'; //

class NewPasswordButton extends StatelessWidget {
  const NewPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
            newPasswordError: (statesCode, errorMessage) =>
                ShowToast.showToastErrorTop(
                    errorMessage: errorMessage, context: context),
            newPasswordSuceess: (data) {
              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context);
              context.pushReplacementNamed(Routes.bottomNavBarRoute);
            });
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: context
                  .read<ForgetPasswordBloc>()
                  .isCreateNewPasswordButtonInVaildator
              ? () {
                  context
                      .read<ForgetPasswordBloc>()
                      .add(const UserForgetNewPasswordButtonEvent());
                }
              : null,
          widget: state.maybeWhen(
            newPasswordLoading: () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                    strokeAlign: 0.01,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  AppStrings.loading,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16.sp,
                      color: ColorManger.white,
                      fontWeight: FontWeightManger.semiBold),
                ),
              ],
            ),
            orElse: () => Text(
              AppStrings.createNewPassword,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 14.sp,
                  color: ColorManger.white,
                  fontWeight: FontWeightManger.semiBold),
            ),
          ),
        );
      },
    );
  }
}
