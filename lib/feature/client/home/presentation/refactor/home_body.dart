import '../../../../../core/common/shared/shared_imports.dart';
import 'package:badges/badges.dart' as badges;

class HomeBody extends StatelessWidget {
  final NotificationService notificationService;
  const HomeBody({super.key, required this.notificationService});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Padding(
      padding: responsive.setPadding(left: 5.5, right: 5.5, bottom: 2, top: 1),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomAndNotificationRow(context),

              responsive.setSizeBox(height: 2),
              const SearchRow(),
              responsive.setSizeBox(height: 3),
              const BannerCarouselSlider(),
              responsive.setSizeBox(height: 3),
              const CategoryListViewBuilder(),
              const NewProductGrideView(),
            ],
          ),
        ),
      ),
    );
  }

  Row _welcomAndNotificationRow(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<LogOutCubit, LogOutState>(
              builder: (context, state) {
                final userName = context.read<LogOutCubit>().initialUserName;
                final firstWord = userName.split(' ').first;
                final formattedName =
                    firstWord[0].toUpperCase() +
                    firstWord.substring(1).toLowerCase();

                return Text(
                  "${context.translate(AppStrings.hello)},  $formattedName 👋",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: responsive.setTextSize(4),
                  ),
                );
              },
            ),
            responsive.setSizeBox(height: 0.9),
            Text(
              "${context.translate(AppStrings.welcometoPatisserieApp)} 🍰",
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: responsive.setTextSize(3.5),
              ),
            ),
          ],
        ),
        const Spacer(),

        GestureDetector(
          onTap: () {
            if (AppInitialRoute.isAnonymousUser) {
              context.pushNamed(Routes.noRoute);
            } else {
              context.pushNamed(Routes.cart);
            }
          },
          child: badges.Badge(
            showBadge: false,
            badgeAnimation: const badges.BadgeAnimation.scale(
              loopAnimation: true,
              curve: Curves.slowMiddle,
              animationDuration: Duration(milliseconds: 2000),
            ),
            position: badges.BadgePosition.topEnd(end: 26.w, top: -2.h),
            badgeStyle: badges.BadgeStyle(padding: EdgeInsets.all(3.h)),
            badgeContent: Text(
              '+9',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.white,
                fontSize: 10.sp,
              ),
            ),
            child: Container(
              height: responsive.setHeight(4.5),
              width: responsive.setWidth(9.8),
              decoration: BoxDecoration(
                color: ColorManger.brownLight,
                borderRadius: BorderRadius.circular(
                  responsive.setBorderRadius(5),
                ),
              ),
              child: Icon(IconlyBold.bag, color: ColorManger.brun),
            ),
          ),
        ),
        responsive.setSizeBox(width: 1),
        StreamBuilder<UserNotificationResponse>(
          stream: notificationService.notificationStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return IconButton(
                onPressed: () {
                  if (AppInitialRoute.isAnonymousUser) {
                    Navigator.of(
                      context,
                      rootNavigator: !false,
                    ).pushNamed(Routes.noRoute);
                  } else {
                    Navigator.of(
                      context,
                      rootNavigator: !false,
                    ).pushNamed(Routes.notification);
                  }
                },
                icon: Container(
                  height: responsive.setHeight(4.5),
                  width: responsive.setWidth(9.8),
                  decoration: BoxDecoration(
                    color: ColorManger.brownLight,
                    borderRadius: BorderRadius.circular(
                      responsive.setBorderRadius(5),
                    ),
                  ),
                  child: Icon(IconlyBold.notification, color: ColorManger.brun),
                ),
              );
            }

            final numberOfNotification = snapshot.data!.data!
                .where((element) => element.isSeen == false)
                .length;

            return badges.Badge(
              showBadge: numberOfNotification != 0,
              badgeAnimation: const badges.BadgeAnimation.scale(),
              position: badges.BadgePosition.topEnd(
                end: numberOfNotification >= 9 ? 8.w : 10.w,
                top: numberOfNotification >= 9 ? 4.h : 5.h,
              ),
              badgeStyle: badges.BadgeStyle(
                padding: EdgeInsets.all(
                  numberOfNotification >= 9 ? 4.h : 5.5.h,
                ),
              ),
              badgeContent: Text(
                numberOfNotification >= 9 ? '+9' : '$numberOfNotification',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.white,
                  fontSize: numberOfNotification >= 9 ? 8.sp : 10.sp,
                ),
              ),
              child: IconButton(
                onPressed: () {
                  context.pushNamed(Routes.notification);
                },
                icon: Container(
                  height: responsive.setHeight(4.5),
                  width: responsive.setWidth(9.8),
                  decoration: BoxDecoration(
                    color: ColorManger.brownLight,
                    borderRadius: BorderRadius.circular(
                      responsive.setBorderRadius(5),
                    ),
                  ),
                  child: Icon(IconlyBold.notification, color: ColorManger.brun),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
