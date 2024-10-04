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
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return Padding(
      padding: responsive.setPadding(left: 5.5, right: 5.5, bottom: 2),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _locationAndNotificationRow(context),
              _locationName(context),
              responsive.setSizeBox(height: 3),
              const SearchRow(),
              responsive.setSizeBox(height: 4),
              const BannerCarouselSlider(),
              responsive.setSizeBox(height: 4),
              const CategoryListViewBuilder(),
              const NewProductGrideView(),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _locationName(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: instance<MapCubit>(),
              child: const MapScreen(
                isHomeMap: true,
              ),
            ),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(IconlyBold.location, color: ColorManger.brunLight),
          SizedBox(
            width: responsive.setWidth(1),
          ),
          BlocBuilder<MapCubit, MapState>(
            builder: (context, state) {
              return ConstrainedBox(
                constraints: BoxConstraints(maxWidth: responsive.setWidth(35)),
                child: Text(context.read<MapCubit>().homeScreenCurrentAddress,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: responsive.setTextSize(3.5))),
              );
            },
          ),
          SizedBox(
            width: responsive.setWidth(1),
          ),
          Icon(
            IconlyBold.arrowDown2,
            color: ColorManger.brunLight,
            size: 15.sp,
          ),
        ],
      ),
    );
  }

  Row _locationAndNotificationRow(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return Row(
      children: [
        SizedBox(
          width: responsive.setWidth(2),
        ),
        Text(AppStrings.location,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: responsive.setTextSize(4))),
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
