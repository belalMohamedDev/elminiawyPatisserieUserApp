import '../../../../../core/common/shared/shared_imports.dart'; // Import shared utilities

/// A custom sign-up button widget that triggers the user registration process.
/// It handles different states such as loading, success, and error using BlocConsumer.
class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        // Handle different state changes such as error and success
        state.whenOrNull(
          // Show error message when state contains an error
          error: (statesCode, errorMessage) => ShowToast.showToastErrorTop(
            errorMessage: errorMessage,
            context: context,
          ),
          // On successful registration, show success message and navigate to home
          suceess: (data) {
            ShowToast.showToastSuccessTop(
              message: data.message!,
              context: context,
            );
            context.pushReplacementNamed(
                Routes.map); // Navigate to the map screen
          },
        );
      },
      builder: (context, state) {
        return CustomButton(
          // Enable the button only if the sign-up form is valid
          onPressed: context.read<SignUpBloc>().isButtonInVaildator
              ? () {
                  // Trigger user registration event when the button is pressed
                  context
                      .read<SignUpBloc>()
                      .add(const UserRegisterButtonEvent());
                }
              : null, // Disable button if form is invalid

          // Change button appearance based on loading state
          widget: state.maybeWhen(
            loading: () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Show loading spinner during registration
                SizedBox(
                  height: responsive.setHeight(2),
                  width: responsive.setWidth(4),
                  child:  CircularProgressIndicator(
                    color: ColorManger.white, // White spinner color
                    strokeWidth: 2.0, // Spinner stroke width
                    strokeAlign: 0.01, // Spinner alignment
                  ),
                ),
                SizedBox(
                  width: responsive
                      .setWidth(3), // Spacer between spinner and text
                ),
                // Show loading text next to the spinner
                Text(
                  AppStrings.loading, // "Loading" text during registration
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize:
                            responsive.setTextSize(3.8), // Responsive text size
                      ),
                ),
              ],
            ),
            // Default button text if not in loading state
            orElse: () => Text(
              AppStrings.signUp, // "Sign Up" text for the button
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize:
                        responsive.setTextSize(3.8), // Responsive text size
                  ),
            ),
          ),
        );
      },
    );
  }
}
