import '../../../../../core/common/shared/shared_imports.dart'; // Import shared utilities

/// The [SignUpView] is a stateless widget that displays the user interface
/// for signing up. It includes fields for entering name, email, password,
/// phone number, and agreeing to the terms and conditions.
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(), // Standard app bar
      resizeToAvoidBottomInset:
          true, // Avoid bottom overflow when keyboard is up
      bottomNavigationBar: SizedBox(
        height: responsive
            .setHeight(8), // Dynamically set height for the bottom bar
        child: const Center(
          child:
              AlreadyHaveAnAccountText(), // Text prompting the user to log in if they already have an account
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: responsive.setPadding(
            left: 5.5,
            right: 5,
          ),
          child: Form(
            key: context
                .read<SignUpBloc>()
                .signUpFormKey, // Retrieve the form key from the SignUpBloc
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the "Create Account" title
                Text(  context.translate(AppStrings.createAccount)  ,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: responsive.setTextSize(4.2))),
                SizedBox(
                  height: responsive.setHeight(1),
                ),
                // Display the prompt to fill in information
                Text(  context.translate(AppStrings.fillYouInformation)  ,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: responsive.setTextSize(3.2))),
                SizedBox(
                  height: responsive.setHeight(3),
                ),
                // Input field for the user's name
                const NameTextFormField(),
                SizedBox(
                  height: responsive.setHeight(1),
                ),
                // Input field for the user's email
                const EmailSignUpTextFormField(),
                SizedBox(
                  height: responsive.setHeight(1),
                ),
                // Input field for the user's password
                const PasswordSignUpTextFormField(),
                SizedBox(
                  height: responsive.setHeight(1),
                ),
                // Input field for the user's phone number
                const PhoneTextFormField(),
                SizedBox(
                  height: responsive.setHeight(2),
                ),
                // Checkbox for agreeing with terms and conditions
                const AgreeWithTermsCondition(),
                SizedBox(
                  height: responsive.setHeight(2),
                ),
                // Sign-up button
                const SignUpButton(),

                SizedBox(
                  height: responsive
                      .setHeight(4), // Spacing before the divider text
                ),

                // Divider text for alternative sign-in methods
                const OrSignInWithText(),
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
      ),
    );
  }
}
