import '../../../../../core/common/shared/shared_imports.dart'; // Importing shared utilities and dependencies

/// A StatelessWidget that represents the button for creating a new password.
///
/// This button interacts with the `ForgetPasswordBloc` to handle the submission of the
/// new password. It also displays a loading spinner when the new password is being created,
/// and shows success or error toasts based on the result of the operation.
class NewPasswordButton extends StatelessWidget {
  const NewPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        // Listen for password change events and handle success or error outcomes
        state.whenOrNull(
          // Show error toast if the new password operation fails
          newPasswordError: (apiErrorModel) => ShowToast.showToastErrorTop(
              errorMessage: apiErrorModel.message!, context: context),
          // Show success toast and navigate to the map screen when successful
          newPasswordSuccess: (data) {
            ShowToast.showToastSuccessTop(
              message: data.message!,
              context: context,
            );
            context.pushReplacementNamed(Routes.map);
          },
        );
      },
      builder: (context, state) {
        return CustomButton(
          // Enable or disable the button based on form validation
          onPressed: context
                  .read<ForgetPasswordBloc>()
                  .isCreateNewPasswordButtonValid
              ? () {
                  context
                      .read<ForgetPasswordBloc>()
                      .add(const UserForgetNewPasswordButtonEvent());
                }
              : null,
          // Display a loading indicator or the button label based on the current state
          widget: state.maybeWhen(
            // If the state is loading, show a spinner and loading text
            newPasswordLoading: () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Circular progress indicator (spinner)
                SizedBox(
                  height: responsive.setHeight(2),
                  width: responsive.setWidth(4),
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                    strokeAlign: 0.01,
                  ),
                ),
                // Spacing between spinner and loading text
                SizedBox(
                  width: responsive.setHeight(2),
                ),
                // Loading text next to the spinner
                Text(
                  AppStrings.loading,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: responsive.setTextSize(3.8),
                      ),
                ),
              ],
            ),
            // If not loading, display the "Create New Password" text
            orElse: () => Text(
              AppStrings.createNewPassword,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: responsive.setTextSize(3.5),
                  ),
            ),
          ),
        );
      },
    );
  }
}
