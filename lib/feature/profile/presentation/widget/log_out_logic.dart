import '../../../../../core/common/shared/shared_imports.dart'; //

BlocListener<LogOutCubit, LogOutState> logoutLogic(BuildContext context) {
  // Initialize the ResponsiveUtils to handle responsive layout adjustments.
  final responsive = ResponsiveUtils(context);
  return BlocListener<LogOutCubit, LogOutState>(
    listener: (context, state) async {
      if (state is LogOutSuccess) {
        ShowToast.showToastSuccessTop(
            message: state.successMessage, context: context);
        await SharedPrefHelper.clearAllSecuredData();

        SharedPrefHelper.setData(PrefKeys.prefsKeyAnonymousUser, false);
        SharedPrefHelper.removeData(PrefKeys.locationArea);
        SharedPrefHelper.removeData(PrefKeys.longAddressHome);
        SharedPrefHelper.removeData(PrefKeys.latAddressHome);

        if (context.mounted) {
          Navigator.of(context, rootNavigator: !false).pushNamedAndRemoveUntil(
              Routes.loginRoute, (Route route) => false);

          context.read<AppLogicCubit>().bottomNavBarController.jumpToTab(0);
        }
      } else if (state is LogOutError) {
        ShowToast.showToastErrorTop(
            errorMessage: state.apiErrorModel.message!, context: context);
        if (state.apiErrorModel.statusCode == 400) {
          await SharedPrefHelper.clearAllSecuredData();

          SharedPrefHelper.setData(PrefKeys.prefsKeyAnonymousUser, false);
          SharedPrefHelper.removeData(PrefKeys.locationArea);
          SharedPrefHelper.removeData(PrefKeys.longAddressHome);
          SharedPrefHelper.removeData(PrefKeys.latAddressHome);

          if (context.mounted) {
            Navigator.of(context, rootNavigator: !false)
                .pushNamedAndRemoveUntil(
                    Routes.loginRoute, (Route route) => false);

            context.read<AppLogicCubit>().bottomNavBarController.jumpToTab(0);
          }
        }
      }
    },
    child: CustomProfileCard(
      title: context.read<LogOutCubit>().initialUserName == 'Guest User'
          ? context.translate(AppStrings.logIn) 
          : context.translate(AppStrings.logOut) ,
      leadingIcon: IconlyBold.logout,
      tap: context.read<LogOutCubit>().initialUserName == 'Guest User'
          ? () async {
              Navigator.of(context, rootNavigator: !false)
                  .pushNamedAndRemoveUntil(
                      Routes.loginRoute, (Route route) => false);

              context.read<AppLogicCubit>().bottomNavBarController.jumpToTab(0);
              await SharedPrefHelper.clearAllSecuredData();

              SharedPrefHelper.setData(PrefKeys.prefsKeyAnonymousUser, false);
              SharedPrefHelper.removeData(PrefKeys.locationArea);
              SharedPrefHelper.removeData(PrefKeys.longAddressHome);
              SharedPrefHelper.removeData(PrefKeys.latAddressHome);
            }
          : () async {
              // Show confirmation dialog before logging out
              final shouldLogOut = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    backgroundColor: ColorManger.backgroundItem,
                    contentPadding: EdgeInsets.only(left: 16.w),
                    titlePadding: EdgeInsets.only(top: 25.h, left: 16.w),
                    title: Text(
                 context.translate(AppStrings.confirmLogout)     ,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: responsive.setTextSize(4)),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                          width: 350.w,
                        ),
                        Text( context.translate(AppStrings.areYouSureYouWantToLogOut) ,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: responsive.setTextSize(4))),
                      ],
                    ),
                    actionsPadding:
                        EdgeInsets.only(top: 20.h, right: 22.w, bottom: 20.h),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text( context.translate(AppStrings.cancel),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: responsive.setTextSize(4))),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 38.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                            color: ColorManger.brun,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text( context.translate(AppStrings.logOut) ,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: responsive.setTextSize(4))),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );

              // Proceed with logout if confirmed
              if (shouldLogOut == true) {
                context.read<LogOutCubit>().checkTokenThenDoLogOut(context);
              }
            },
    ),
  );
}
