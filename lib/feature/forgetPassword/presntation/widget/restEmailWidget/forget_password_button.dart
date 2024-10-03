import '../../../../../core/common/shared/shared_imports.dart'; // Import necessary packages and utilities

/// A StatelessWidget representing the Forget Password button.
///
/// This button triggers the password reset process when pressed.
class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        // Handle different states of the ForgetPasswordBloc
        state.whenOrNull(
          error: (statesCode, errorMessage) {
            // Show an error toast when there's an error state
            ShowToast.showToastErrorTop(
                errorMessage: errorMessage, context: context);
          },
          success: (data) {
            // Show success toast and navigate to verification code view on success
            ShowToast.showToastSuccessTop(
                message: data.message!, context: context);
            context.pushReplacementNamed(Routes.verificationCodeViewRoute);
          },
        );
      },
      builder: (context, state) {
        return CustomButton(
          // Button is enabled only if the validation condition is met
          onPressed: context
                  .read<ForgetPasswordBloc>()
                  .isContinueForgetPasswordButtonValid
              ? () {
                  // Dispatch event to start the password reset process
                  context
                      .read<ForgetPasswordBloc>()
                      .add(const UserForgetPasswordButtonEvent());
                }
              : null,
          widget: state.maybeWhen(
            loading: () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Show loading indicator when the state is loading
                SizedBox(
                  height: responsive.setHeight(2),
                  width: responsive.setWidth(4),
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                    strokeAlign: 0.01,
                  ),
                ),
                 SizedBox(
                  width: responsive
                      .setHeight(2), // Spacer between spinner and text
                ),
                Text(
                  AppStrings.loading,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: responsive.setTextSize(3.8),
                      ),
                ),
              ],
            ),
            orElse: () => Text(
              AppStrings.continueText,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: responsive.setTextSize(3.8),
                  ),
            ),
          ),
        );
      },
    );
  }
}
