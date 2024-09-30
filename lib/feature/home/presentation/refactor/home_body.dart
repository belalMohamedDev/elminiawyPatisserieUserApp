import '../../../../../core/common/shared/shared_imports.dart'; //
import 'package:badges/badges.dart' as badges;

class HomeBody extends StatelessWidget {
  final NotificationService notificationService;
  const HomeBody({
    super.key,
    required this.notificationService,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _locationAndNotificationRow(context),
              _locationName(context),
              SizedBox(
                height: 20.h,
              ),
              const SearchRow(),
              SizedBox(
                height: 30.h,
              ),
              const BannerCarouselSlider(),
              SizedBox(
                height: 30.h,
              ),
              const CategoryListViewBuilder(),
              SizedBox(
                height: 20.h,
              ),
              const NewProductGrideView(),
            ],
          ),
        ),
      ),
    );
  }

  Row _locationName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(IconlyBold.location, color: ColorManger.brown),
        SizedBox(
          width: 5.w,
        ),
        Text("New York, USA",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 14.sp)),
        SizedBox(
          width: 5.w,
        ),
        Icon(
          IconlyBold.arrowDown2,
          color: ColorManger.brown,
          size: 15.sp,
        ),
      ],
    );
  }

  Row _locationAndNotificationRow(BuildContext context) {
    return Row(
      children: [
        Text("Location",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brunLight,
                fontSize: 14.sp)),
        const Spacer(),
        ValueListenableBuilder(
            valueListenable: notificationService.recieveNotification,
            builder: (context, value, child) {
              return StreamBuilder<UserNotificationResponse>(
                  stream: notificationService.notificationStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data == null) {
                      return IconButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.notification);
                        },
                        icon: Icon(IconlyBold.notification,
                            color: ColorManger.brun),
                      );
                    }
                    final numberOfNotification = snapshot.data!.data!
                        .where(
                          (element) => element.isSeen == false,
                        )
                        .length;
                    return badges.Badge(
                      showBadge: numberOfNotification != 0 ? true : false,
                      badgeAnimation: const badges.BadgeAnimation.scale(),
                      position: badges.BadgePosition.topEnd(
                          end: numberOfNotification >= 9 ? 8.w : 10.w,
                          top: numberOfNotification >= 9 ? 4.h : 5.h),
                      badgeStyle: badges.BadgeStyle(
                          padding: EdgeInsets.all(
                              numberOfNotification >= 9 ? 4.h : 5.5.h)),
                      badgeContent: Text(
                          numberOfNotification >= 9
                              ? '+9'
                              : '$numberOfNotification',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.white,
                                  fontSize: numberOfNotification >= 9
                                      ? 8.sp
                                      : 10.sp)),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.notification);
                        },
                        icon: Icon(IconlyBold.notification,
                            color: ColorManger.brun),
                      ),
                    );
                  });
            }),
      ],
    );
  }
}
