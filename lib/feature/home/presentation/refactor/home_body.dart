import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../core/common/sharedWidget/search_row.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../notification/data/model/user_notification_resp.dart';
import '../../../notification/logic/notification_service.dart';
import '../widget/banner_carousel_slider.dart';
import '../widget/category_list_view_builder.dart';
import '../widget/new_product_gride_view.dart';

class HomeBody extends StatelessWidget {
  final NotificationService notificationService;
  final Stream<UserNotificationResponse> notificationStream;
  const HomeBody(
      {super.key,
      required this.notificationService,
      required this.notificationStream});

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
        StreamBuilder<UserNotificationResponse>(
            stream: notificationStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: !false)
                        .pushNamed(Routes.notification);
                  },
                  icon: Icon(IconlyBold.notification, color: ColorManger.brun),
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
                    numberOfNotification >= 9 ? '+9' : '$numberOfNotification',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.white,
                        fontSize: numberOfNotification >= 9 ? 8.sp : 10.sp)),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: !false)
                        .pushNamed(Routes.notification);
                  },
                  icon: Icon(IconlyBold.notification, color: ColorManger.brun),
                ),
              );
            })
      ],
    );
  }
}
