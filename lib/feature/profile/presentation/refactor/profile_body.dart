


import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.h,
          color: ColorManger.brun,
          child: BlocBuilder<LogOutCubit, LogOutState>(
            builder: (context, state) {
              bool initUserNameCheck =
                  context.read<LogOutCubit>().initialUserName == 'Guest User';
              return Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  initUserNameCheck
                      ? Image.asset(
                          ImageAsset.guestIconGreen,
                          color: ColorManger.white,
                          height: 100.h,
                        )
                      : Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: Colors.white70),
                          child: Center(
                            child: Text(
                                context
                                    .read<LogOutCubit>()
                                    .initialUserName
                                    .substring(0, 2)
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: ColorManger.brun,
                                        fontSize: 60.sp)),
                          ),
                        ),
                  SizedBox(
                    width: 20.w,
                  ),
                  initUserNameCheck
                      ? InkWell(
                        onTap: () async{
                                 Navigator.of(context, rootNavigator: !false)
                                .pushNamedAndRemoveUntil(
                                    Routes.loginRoute, (Route route) => false);

                            context
                                .read<AppLogicCubit>()
                                .bottomNavBarController
                                .jumpToTab(0);

                            await SharedPrefHelper.clearAllSecuredData();
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Guest User",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontFamily:
                                              FontConsistent.fontFamilyAcme,
                                          color: Colors.white70,
                                          fontSize: 13.sp)),
                              Text("Login to View all the features",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontFamily:
                                              FontConsistent.fontFamilyAcme,
                                          color: Colors.white60,
                                          fontSize: 13.sp)),
                            ],
                          ),
                      )
                      : Text(
                          "Welcome back! Let's achieve\n great things today!",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                  ),
                        ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        profileColumnCard(context),
      ],
    );
  }
}
