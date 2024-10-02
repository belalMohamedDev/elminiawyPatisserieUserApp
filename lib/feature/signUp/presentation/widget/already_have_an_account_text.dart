import '../../../../../core/common/shared/shared_imports.dart'; // Import shared utilities

/// A custom widget that displays a prompt for users to sign in if they already have an account.
/// It consists of a message "Already have an account?" followed by a clickable "Sign In" text.
class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return Align(
      alignment: Alignment.topCenter, // Center the text horizontally
      child: Text.rich(
        TextSpan(
          text:
              AppStrings.alreadyHaveAccount, // "Already have an account?" text
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: responsive.setTextSize(4), // Responsive font size
              ),
          children: [
            WidgetSpan(
              child: SizedBox(
                width:
                    responsive.setWidth(3), // Spacer between the two text parts
              ),
            ),
            TextSpan(
              // Recognizer to handle the tap gesture on the "Sign In" text
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigate to the login route when tapped
                  context.pushReplacementNamed(Routes.loginRoute);
                },
              text: AppStrings.signIn, // "Sign In" text
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize:
                      responsive.setTextSize(4.5), // Larger font for emphasis
                  fontFamily:
                      FontConsistent.fontFamilyAcme), // Custom font family
            ),
          ],
        ),
        style: Theme.of(context).textTheme.bodyLarge, // Base text style
      ),
    );
  }
}
