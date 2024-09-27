

import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

BlocBuilder profileColumnCard(BuildContext context) {
  return BlocBuilder<LogOutCubit, LogOutState>(
    builder: (context, state) {
      bool initUserNameCheck =
          context.read<LogOutCubit>().initialUserName == 'Guest User';
      return Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                CustomProfileCard(
                  title: "My Profile",
                  leadingIcon: IconlyBold.profile,
                  tap: initUserNameCheck
                      ? () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.noRoute);
                        }
                      : () {
                          chaneProfileDataBottomSheet(context);
                        },
                ),
                CustomProfileCard(
                  title: "My Address",
                  leadingIcon: IconlyBold.location,
                  tap: initUserNameCheck
                      ? () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.noRoute);
                        }
                      : () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.address);
                        },
                ),
                CustomProfileCard(
                  title: "My Orders",
                  leadingIcon: IconlyBold.bag,
                  tap: initUserNameCheck
                      ? () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.noRoute);
                        }
                      : () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.myOrder);
                        },
                ),
                CustomProfileCard(
                  title: "My WishList",
                  leadingIcon: IconlyBold.heart,
                  tap: initUserNameCheck
                      ? () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.noRoute);
                        }
                      : () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.wishList);
                        },
                ),
                CustomProfileCard(
                  title: "Settings",
                  leadingIcon: IconlyBold.setting,
                  tap: () {
                    settingChangeBottomSheet(context);
                  },
                ),
                logoutLogic(context)
              ],
            ),
          ),
          if (state is LogOutLoading)
            Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                    color: ColorManger.brun,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.r),
                    child: CircularProgressIndicator(
                      color: ColorManger.white,
                      strokeWidth: 3.sp,
                    ),
                  ),
                )),
        ],
      );
    },
  );
}
