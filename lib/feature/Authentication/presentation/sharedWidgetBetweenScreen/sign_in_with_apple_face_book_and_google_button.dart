import '../../../../../core/common/shared/shared_imports.dart'; // Import shared utilities

/// The [SignInWithAppleFaceBookAndGoogleButton] widget provides buttons for
/// users to sign in using Google or Apple. Each button is styled with an icon
/// and text, and is designed to be responsive to different screen sizes.
///
/// This widget includes:
/// - A button for signing in with Google.
/// - A button for signing in with Apple.
/// - Each button has an icon on the left and descriptive text on the right.
class SignInWithAppleFaceBookAndGoogleButton extends StatelessWidget {
  const SignInWithAppleFaceBookAndGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return BlocProvider(
        create: (context) => instance<AuthenticationWithGoogleAndAppleCubit>(),
        child: BlocConsumer<AuthenticationWithGoogleAndAppleCubit,
            AuthenticationWithGoogleAndAppleState>(
          listener: (context, state) {
            state.whenOrNull(
              authenticationWithGoogleError: (apiErrorModel) {
                // Show an error toast when login fails
                ShowToast.showToastErrorTop(
                    errorMessage: apiErrorModel.message!, context: context);
              },
              authenticationWithGoogleSuccess: (authResponse)async {
                // Show a success toast when login is successful
                ShowToast.showToastSuccessTop(
                    message: authResponse.message!, context: context);
                // Navigate to the map screen after a successful login
                await AppLogin().storeAuthData(authResponse);

                if (authResponse.data!.role == "user") {
                  // Ensure the context is still mounted before navigating
                  if (context.mounted) {
                    context.pushReplacementNamed(Routes.map);
                  }
                } else if (authResponse.data!.role == "admin") {
                  // Ensure the context is still mounted before navigating
                  if (context.mounted) {
                    context.pushReplacementNamed(Routes.adminMenue);
                  }
                } else {
                  ShowToast.showToastErrorTop(
                      errorMessage: context
                          .translate(AppStrings.thisAccountNotAccessInThisApp),
                      context: context);
                }
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                // Button for Google sign-in
                CustomButton(
                  onPressed: () {
                    context
                        .read<AuthenticationWithGoogleAndAppleCubit>()
                        .signInWithGoogle();
                  }, // Replace with the function to handle Google sign-in
                  color: ColorManger.white, // Button background color
                  borderColor:
                      ColorManger.brownLight, // Border color for the button
                  widget: LoadingButtonContent(
                    state: state,
                    defultWidget: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Align content centrally
                      children: [
                        // Google icon
                        Image.asset(ImageAsset.google),
                        SizedBox(
                          width: responsive
                              .setWidth(4), // Space between icon and text
                        ),
                        // Google sign-in text
                        Text(
                          context.translate(AppStrings.signInWithGoogle),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                fontSize: responsive
                                    .setTextSize(3.8), // Responsive text size
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Spacing between the buttons
                SizedBox(
                  height: responsive.setHeight(2),
                ),
                // Button for Apple sign-in
                CustomButton(
                  onPressed:
                      null, // Replace with the function to handle Apple sign-in
                  color: ColorManger.white, // Button background color
                  borderColor:
                      ColorManger.brownLight, // Border color for the button
                  widget: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Align content centrally
                    children: [
                      // Apple icon
                      SizedBox(
                        child: Image.asset(ImageAsset.apple),
                      ),
                      SizedBox(
                        width: responsive
                            .setWidth(4), // Space between icon and text
                      ),
                      // Apple sign-in text
                      Text(
                        context.translate(AppStrings.signInWithApple),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: responsive
                                  .setTextSize(3.8), // Responsive text size
                            ),
                      ),
                      SizedBox(
                        width: responsive
                            .setWidth(4), // Space between icon and text
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
