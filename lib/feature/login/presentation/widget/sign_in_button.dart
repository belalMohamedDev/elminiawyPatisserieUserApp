import '../../../../../core/common/shared/shared_imports.dart'; // Import shared utilities

/// The [SignInButton] widget represents the primary button for initiating the login process.
/// It integrates with the [LoginBloc] to manage user interaction and state feedback such as
/// showing loading indicators, handling success and error responses, and triggering navigation.
///
/// This widget includes:
/// - A custom button that responds to user input
/// - A loading state with a progress indicator
/// - Success and error handlers through BlocConsumer
class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return BlocConsumer<LoginBloc, LoginState>(
      // Listener to respond to state changes such as success or error events
      listener: (context, state) {
        state.whenOrNull(
          error: (apiErrorModel) {
            // Show an error toast when login fails
            ShowToast.showToastErrorTop(
                errorMessage: apiErrorModel.message!, context: context);
          },
          suceess: (data) {
            if (data.data!.role == "user") {
              // Show a success toast when login is successful
              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context);
              // Navigate to the map screen after a successful login
              context.pushReplacementNamed(Routes.map);
            } else {
              ShowToast.showToastErrorTop(
                  errorMessage:AppStrings.thisAccountNotAccessInThisApp,
                  context: context);
            }
          },
        );
      },
      // Builder to display the button UI based on the current state
      builder: (context, state) {
        return CustomButton(
          // Enable the button only if the input validator passes (from LoginBloc)
          onPressed: context.read<LoginBloc>().isButtonInVaildator
              ? () {
                  // Trigger the login button event in the LoginBloc
                  context.read<LoginBloc>().add(const UserLoginButton());
                }
              : null, // If validation fails, the button is disabled
          widget: state.maybeWhen(
            // Display a loading indicator when the login is in progress
            loading: () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Circular progress indicator with dynamic sizing
                SizedBox(
                  height: responsive.setHeight(2),
                  width: responsive.setWidth(4),
                  child: CircularProgressIndicator(
                    color: ColorManger.white, // Indicator color
                    strokeWidth: 2.0, // Line thickness of the indicator
                    strokeAlign:
                        0.01, // Alignment of the stroke (indicator line)
                  ),
                ),
                SizedBox(
                  width: responsive
                      .setHeight(2), // Spacing between the indicator and text
                ),
                // Loading text displayed next to the progress indicator
                Text(
                  AppStrings.loading,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize:
                            responsive.setTextSize(3.8), // Dynamic text size
                      ),
                ),
              ],
            ),
            // Default button label when not loading
            orElse: () => Text(
              AppStrings.signIn,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: responsive.setTextSize(
                        3.8), // Adjusted font size for responsiveness
                  ),
            ),
          ),
        );
      },
    );
  }
}
