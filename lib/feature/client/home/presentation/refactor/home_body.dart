import '../../../../../core/common/shared/shared_imports.dart'; // Shared imports for project utilities
import 'package:badges/badges.dart' as badges;

/// `HomeBody` is a `StatelessWidget` that provides the main content of the home screen.
/// It includes location details, a notification icon with a badge for unread notifications,
/// a search bar, and product display sections.

class HomeBody extends StatelessWidget {
  // The notification service to handle receiving and displaying notifications
  final NotificationService notificationService;
  const HomeBody({super.key, required this.notificationService});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return Padding(
      padding: responsive.setPadding(left: 5.5, right: 5.5, bottom: 2, top: 1),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the location and notification row at the top
              _welcomAndNotificationRow(context),

              responsive.setSizeBox(height: 2), // Adds vertical space
              const SearchRow(), // Search bar row
              responsive.setSizeBox(height: 3), // Adds vertical space
              const BannerCarouselSlider(), // Image carousel for banners
              responsive.setSizeBox(height: 3), // Adds vertical space
              const CategoryListViewBuilder(), // Horizontal list view for categories
              const NewProductGrideView(), // Grid view for displaying new products
            ],
          ),
        ),
      ),
    );
  }

  /// Widget that displays the location label and the notification icon.
  /// The notification icon shows a badge if there are unread notifications.
  Row _welcomAndNotificationRow(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
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
          stream: notificationService.notificationStream, // Notification stream
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              // If no notifications, show a plain notification icon
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

            // Calculate the number of unread notifications
            final numberOfNotification = snapshot.data!.data!
                .where((element) => element.isSeen == false)
                .length;

            // Display a badge with the count of unread notifications
            return badges.Badge(
              showBadge:
                  numberOfNotification !=
                  0, // Show badge if there are unread notifications
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
              // Show "+9" if more than 9 unread notifications, else show the count
              badgeContent: Text(
                numberOfNotification >= 9 ? '+9' : '$numberOfNotification',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.white,
                  fontSize: numberOfNotification >= 9 ? 8.sp : 10.sp,
                ),
              ),
              // Notification icon button
              child: IconButton(
                onPressed: () {
                  context.pushNamed(
                    Routes.notification,
                  ); // Navigate to notification screen
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
