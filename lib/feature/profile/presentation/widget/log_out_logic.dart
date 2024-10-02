import '../../../../../core/common/shared/shared_imports.dart'; //


BlocListener<LogOutCubit, LogOutState> logoutLogic(BuildContext context) {
  return BlocListener<LogOutCubit, LogOutState>(
    listener: (context, state) async {
      if (state is LogOutSuccess) {
        ShowToast.showToastSuccessTop(
            message: state.successMessage, context: context);
        await SharedPrefHelper.clearAllSecuredData();

        

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
            errorMessage: state.errorMessage, context: context);
        if (state.statesCode == 400) {
          await SharedPrefHelper.clearAllSecuredData();
          
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
          ? "Log In"
          : "Log Out",
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
                    title: const Text('Confirm Logout'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                          width: 350.w,
                        ),
                        Text('Are you sure you want to log out?',
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManger.brunLight)),
                      ],
                    ),
                    actionsPadding:
                        EdgeInsets.only(top: 20.h, right: 22.w, bottom: 20.h),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('Cancel',
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManger.brun)),
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
                            child: Text('Log Out',
                                style: TextStyle(
                                    fontSize: 12.sp, color: ColorManger.white)),
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
