import '../../../../../core/common/shared/shared_imports.dart'; // Import the shared dependencies and utilities

/// The [AlreadyAccountTextSpan] widget displays a prompt for users who already have an account.
/// It shows a "Sign In" link that navigates to the login screen when tapped.
class AlreadyAccountTextSpan extends StatelessWidget {
  const AlreadyAccountTextSpan({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    // Text.rich allows combining multiple text styles and spans into one text widget
    return Text.rich(
      TextSpan(
        // Display the text "Already have an account?"
        text: AppStrings.alreadyHaveAnAccount,

        // Apply the bodySmall style and adjust the font size responsively
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: responsive.setTextSize(4)),

        children: [
          // Add a small horizontal space between the regular text and the sign-in link
          WidgetSpan(
            child: SizedBox(
                width: responsive.setWidth(3)), // 10 width units of spacing
          ),

          // "Sign In" text with a tap gesture recognizer to handle the navigation action
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                // Navigate to the login screen and remove all previous routes
                context.pushNamedAndRemoveUntil(Routes.loginRoute);

                // Store user progress in shared preferences to mark onboarding as completed
                await SharedPrefHelper.setData(
                    PrefKeys.prefsKeyOnBoardingScreenView, true);
              },

            // Display the text "Sign In"
            text: AppStrings.signIn,

            // Apply the titleLarge style from the theme to the "Sign In" text
            style: Theme.of(context).textTheme.titleLarge!,
          ),
        ],
      ),
    );
  }
}
