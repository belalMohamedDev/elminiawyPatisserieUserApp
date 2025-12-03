import '../../../../../core/common/shared/shared_imports.dart'; // Import barrel file for shared utilities


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
 
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(), 
      resizeToAvoidBottomInset:
          true, 
      bottomNavigationBar: SizedBox(
        height:
            responsive.setHeight(8), 
        child: const HaveAnAccountText(),
      ),
      body: SingleChildScrollView(
      
        child: Padding(
       
          padding:
              responsive.setPadding(left: 5.5, right: 5, top: 5, bottom: 4),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, 
            children: [
        
              const HeadlineTextAuthScreen(
                titleText: AppStrings.welcomeBack,
                subTitleText: AppStrings.toGetStartedSignInToYourAccount,
              ),

              SizedBox(
                height: responsive
                    .setHeight(6), 
              ),

       
              const EmailLoginTextFormField(),
              SizedBox(
                height: responsive
                    .setHeight(2), 
              ),

             
              const PasswordLoginTextFormField(),
              SizedBox(
                height: responsive
                    .setHeight(3), 
              ),

           
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    context.pushReplacementNamed(Routes
                        .forgetPasswordRoute); 
                  },
                  child: Text(
                    context.translate(AppStrings.forgetPassword),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: responsive.setTextSize(
                              3.5), 
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: responsive
                    .setHeight(3.5), 
              ),

      
              const SignInButton(),
              SizedBox(
                height:
                    responsive.setHeight(5),
              ),

           
              const OrSignWithText(),
              SizedBox(
                height: responsive
                    .setHeight(3), 
              ),

         
              const SignInWithAppleFaceBookAndGoogleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
