import '../../../../../../core/common/shared/shared_imports.dart'; 


class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(

      listener: (context, state) {
        state.whenOrNull(
          error: (apiErrorModel) {
 
            ShowToast.showToastErrorTop(
                errorMessage: apiErrorModel.message!, context: context);
          },
          suceess: (authResponse) async {
       
            ShowToast.showToastSuccessTop(
                message: authResponse.message!, context: context);
  
           await AppLogin().storeAuthData(authResponse);

            if (authResponse.data!.role == "user") {
       
              if (context.mounted) {
                context.pushReplacementNamed(Routes.bottomNavBarRoute);
              }
            } else if (authResponse.data!.role == "admin") {
   
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
        return CustomButton(

          onPressed: context.read<LoginBloc>().isButtonInVaildator
              ? () {
            
                  context.read<LoginBloc>().add(const UserLoginButton());
                }
              : null, 
          widget: LoadingButtonContent(
            defaultText: AppStrings.signIn,
            state: state,
          ),
        );
      },
    );
  }
}
