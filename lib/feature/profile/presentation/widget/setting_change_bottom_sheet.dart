
import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file


Future<dynamic> settingChangeBottomSheet(BuildContext context) {
  return showCupertinoModalBottomSheet(
      useRootNavigator: true,
      barrierColor: Colors.black54,
      elevation: 20.r,
      context: context,
      builder: (context) => SizedBox(
            height: 320.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
              child: Material(
                color: ColorManger.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ValueListenableBuilder(
                          valueListenable:
                              FirebaseCloudMessaging().isNotificationSubscribe,
                          builder: (_, value, __) {
                            return CustomProfileCard(
                              title: AppStrings.notification,
                              actionWidget: Transform.scale(
                                scale: 0.75,
                                child: CupertinoSwitch(
                                  value: value,
                                  activeColor: ColorManger.brun,
                                  trackColor: ColorManger.brunLight,
                                  onChanged: (value) async {
                                    await FirebaseCloudMessaging()
                                        .toggleNotificationSubscription();
                                  },
                                ),
                              ),
                              leadingIcon: IconlyBold.notification,
                              tap: () async {
                                await FirebaseCloudMessaging()
                                    .toggleNotificationSubscription();
                              },
                            );
                          }),
                      CustomProfileCard(
                        title: AppStrings.language,
                        subTitle: AppStrings.english,
                        leadingIcon: Icons.language,
                        tap: () {},
                      ),
                      CustomProfileCard(
                        title: AppStrings.darkMode,
                        leadingIcon: Icons.light_mode,
                        tap: () {},
                        actionWidget: Transform.scale(
                          scale: 0.75,
                          child: CupertinoSwitch(
                            value: false,
                            activeColor: ColorManger.brun,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
}
