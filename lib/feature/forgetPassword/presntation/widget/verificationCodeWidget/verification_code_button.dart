import '../../../../../../core/common/shared/shared_imports.dart'; // Import shared utilities

/// A StatelessWidget representing the verification button for the password reset process.
///
/// This button interacts with the `ForgetPasswordBloc` to handle the submission of the verification code.
/// It displays a loading indicator while processing and shows appropriate success or error messages.
class VerificationCodeButton extends StatelessWidget {
  const VerificationCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ResponsiveUtils for responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          // Handle errors during the verification process
          verifyCodeError: (apiErrorModel) => ShowToast.showToastErrorTop(
              errorMessage: apiErrorModel.message!, context: context),
          // Handle successful verification
          verifyCodeSuccess: (data) {
            ShowToast.showToastSuccessTop(
              message: data.message!,
              context: context,
            );
            // Navigate to the new password screen on success
            context.pushReplacementNamed(Routes.newPassword);
          },
          // Handle generic errors
          error: (apiErrorModel) => ShowToast.showToastErrorTop(
              errorMessage: apiErrorModel.message!, context: context),
          // Handle generic success
          success: (data) {
            ShowToast.showToastSuccessTop(
              message: data.message!,
              context: context,
            );
          },
        );
      },
      builder: (context, state) {
        return CustomButton(
          // Enable button if the verification code is valid
          onPressed: context
                  .read<ForgetPasswordBloc>().isVerifyCodeButtonValid
                  
              ? () {
                  context.read<ForgetPasswordBloc>().add(
                        const UserForgetPasswordVerifyButtonEvent(),
                      );
                }
              : null, // Disable button if the validator fails
          widget: state.maybeWhen(
            verifyCodeLoading: () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
              AppStrings.verify, // Default button text
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
