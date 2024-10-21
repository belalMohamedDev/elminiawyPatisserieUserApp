import '../../../../../core/common/shared/shared_imports.dart'; // Import barrel file for shared utilities

/// The [LoginView] widget represents the login screen where users can input their
/// email and password to sign in or choose to sign in with alternative methods.
///
/// This screen includes:
/// - Input fields for email and password
/// - A "Forgot Password" option
/// - A sign-in button
/// - Alternative sign-in methods (Apple, Facebook, Google)
/// - A prompt for users to sign up if they don't have an account
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(), // Standard AppBar
      resizeToAvoidBottomInset:
          true, // Avoid bottom overflow when keyboard is up
      bottomNavigationBar: SizedBox(
        height:
            responsive.setHeight(8), // Dynamically set height for bottom bar
        child: const HaveAnAccountText(), // Text prompting the user to sign up
      ),
      body: SingleChildScrollView(
        // Allows scrolling in case the keyboard covers part of the screen
        child: Padding(
          // Dynamically apply padding based on the screen size using the responsive utility
          padding:
              responsive.setPadding(left: 5.5, right: 5, top: 5, bottom: 4),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the left
            children: [
              // Main headline "Welcome Back"
              Text(
                context.translate(AppStrings.welcomeBack),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge, // Uses theme styling
              ),
              SizedBox(
                height: responsive.setHeight(1), // Spacing after the headline
              ),

              // Subtitle prompting the user to sign in
              Text(
                context.translate(AppStrings.toGetStartedSignInToYourAccount),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: responsive.setTextSize(
                        3.8)), // Adjust font size based on screen size
              ),
              SizedBox(
                height: responsive
                    .setHeight(6), // Spacing before the email input field
              ),

              // Email input field widget
              const EmailLoginTextFormField(),
              SizedBox(
                height: responsive
                    .setHeight(2), // Spacing before the password input field
              ),

              // Password input field widget
              const PasswordLoginTextFormField(),
              SizedBox(
                height: responsive
                    .setHeight(3), // Spacing before the "Forgot Password" link
              ),

              // "Forgot Password" link aligned to the right
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    context.pushReplacementNamed(Routes
                        .forgetPasswordRoute); // Navigate to the "Forgot Password" screen
                  },
                  child: Text(
                    context.translate(AppStrings.forgetPassword),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: responsive.setTextSize(
                              3.5), // Adjust font size for the text
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: responsive
                    .setHeight(3.5), // Spacing before the sign-in button
              ),

              // Sign-in button widget
              const SignInButton(),
              SizedBox(
                height:
                    responsive.setHeight(5), // Spacing before the divider text
              ),

              // Divider text for alternative sign-in methods
              const OrSignWithText(),
              SizedBox(
                height: responsive
                    .setHeight(3), // Spacing before social sign-in buttons
              ),

              // Social sign-in buttons (Apple, Facebook, Google)
              const SignInWithAppleFaceBookAndGoogleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
