import '../../../../../core/common/shared/shared_imports.dart'; // Import the shared dependencies and utilities

/// The [ContinueWithoutSigningUp] widget displays a prompt for users who already have an account.
/// It shows a "Sign In" link that navigates to the login screen when tapped.
class ContinueWithoutSigningUp extends StatelessWidget {
  const ContinueWithoutSigningUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    // Text.rich allows combining multiple text styles and spans into one text widget
    return TextButton(
        onPressed: () async {
          // Navigate to the next screen (e.g., Map screen) and remove all previous routes
          context.pushNamedAndRemoveUntil(Routes.map);

          // Store user progress in shared preferences to mark onboarding as completed
          await SharedPrefHelper.setData(
              PrefKeys.prefsKeyOnBoardingScreenView, true);

          // Store anonymous user data in shared preferences (if applicable)
          await SharedPrefHelper.setData(PrefKeys.prefsKeyAnonymousUser, true);

          // Store login map status in shared preferences (if applicable)
          await SharedPrefHelper.setData(PrefKeys.prefsSetLoginMap, true);
        },
        child: Text(
          context.translate(AppStrings
              .continueWithoutSigningUp), //     style: Theme.of(context).textTheme.bodySmall!.copyWith(
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: responsive.setTextSize(4),
          
              ),
        ));
  }
}
