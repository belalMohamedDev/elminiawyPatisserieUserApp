
import '../../../../../core/common/shared/shared_imports.dart'; // Importing necessary packages and utilities

/// A screen that allows users to enter their email address
/// to initiate the password recovery process.
///
/// The user will receive a verification code to reset their password.
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsible for responsive layout adjustments based on screen size
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(), // Standard app bar for screen navigation
      body: Padding(
        // Provides consistent padding around the content
        padding: responsive.setPadding(left: 5, right: 5, top: 15),
        child: SingleChildScrollView(
          // Ensures the content is scrollable for smaller screens
          child: Column(
            children: [
              /// Title: "Reset Your Password"
              ///
              /// Provides the main heading for the password recovery screen.
              Text(
                AppStrings.restYourPassword,
                style: Theme.of(context).textTheme.titleSmall,
              ),

              /// Adds vertical spacing between the title and description.
              SizedBox(
                height: responsive.setHeight(2),
              ),

              /// Description: "Enter your email to receive a verification code"
              ///
              /// Briefly explains to the user what to do on this screen.
              Text(
                AppStrings.enterYourEmailToSendVerifyCode,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: responsive.setTextSize(3.5)),
                textAlign:
                    TextAlign.center, // Center-aligns the description text
              ),

              /// Adds vertical spacing before the email input field.
              SizedBox(
                height: responsive.setHeight(8),
              ),

              /// Email Input Field
              ///
              /// Widget that allows the user to input their email address for password recovery.
              const EmailForgetPasswordTextFormField(),

              /// Adds vertical spacing after the email input field.
              SizedBox(
                height: responsive.setHeight(4),
              ),

              /// Submit Button
              ///
              /// Button that submits the email and sends a verification code.
              const ForgetPasswordButton(),

              /// Adds vertical spacing before the "Back to Login" option.
              SizedBox(
                height: responsive.setHeight(4),
              ),

              /// "Back to Login" Option
              ///
              /// Allows the user to navigate back to the login screen.
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    // Navigates to the login route
                    context.pushReplacementNamed(Routes.loginRoute);
                    // Clears the email address field from the ForgetPasswordBloc
                    context
                        .read<ForgetPasswordBloc>()
                        .userForgetPasswordEmailAddress
                        .clear();
                  },
                  child: Text(
                    AppStrings.backToLogin,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: responsive.setTextSize(4)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
