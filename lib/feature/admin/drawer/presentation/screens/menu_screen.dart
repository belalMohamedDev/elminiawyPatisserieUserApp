import 'package:elminiawy/core/common/shared/shared_imports.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Container(
      color: ColorManger.brun,
      child: Padding(
        padding:
            responsive.setPadding(top: 20, left: 1.5, right: 45, bottom: 8),
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              child: ListTile(
                splashColor: ColorManger.white,
                onTap: () {
                  context.read<AdminHomeCubit>().drawerOpenOrClose(
                        0,
                        0,
                        1,
                        0,
                        false,
                      );
                },
                horizontalTitleGap: 25.0,
                leading: Icon(
                  IconlyBold.home,
                  color: ColorManger.white,
                ),
                title: Text(
                  context.translate(AppStrings.home),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: responsive.setTextSize(3.8)),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {
                  context.pushNamed(Routes.adminCategory);
                },
                horizontalTitleGap: 25.0,
                leading: Icon(
                  IconlyBold.category,
                  color: ColorManger.white,
                ),
                title: Text(
                  context.translate(AppStrings.categories),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: responsive.setTextSize(3.8)),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {},
                horizontalTitleGap: 25.0,
                leading: Icon(
                  Icons.category,
                  color: ColorManger.white,
                ),
                title: Text(
                  context.translate(AppStrings.subCategory),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: responsive.setTextSize(3.8)),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {},
                horizontalTitleGap: 25.0,
                leading: Icon(
                  IconlyBold.image,
                  color: ColorManger.white,
                ),
                title: Text(
                  context.translate(AppStrings.banners),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: responsive.setTextSize(3.8)),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {},
                horizontalTitleGap: 25.0,
                leading: Image.asset(
                  ImageAsset.dessert,
                  color: ColorManger.white,
                  height: responsive.setHeight(2.4),
                ),
                title: Text(
                  context.translate(AppStrings.products),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: responsive.setTextSize(3.8)),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {},
                horizontalTitleGap: 25.0,
                leading: Image.asset(
                  ImageAsset.order,
                  color: ColorManger.white,
                  height: responsive.setHeight(2.4),
                ),
                title: Text(
                  context.translate(AppStrings.orders),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: responsive.setTextSize(3.8)),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {},
                horizontalTitleGap: 25.0,
                leading: Image.asset(
                  ImageAsset.deliveryBike,
                  color: ColorManger.white,
                  height: responsive.setHeight(2.4),
                ),
                title: Text(
                  context.translate(AppStrings.driver),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: responsive.setTextSize(3.8)),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {},
                horizontalTitleGap: 25.0,
                leading: Icon(
                  IconlyBold.user3,
                  color: ColorManger.white,
                ),
                title: Text(
                  context.translate(AppStrings.users),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: responsive.setTextSize(3.8)),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {},
                horizontalTitleGap: 25.0,
                leading: Icon(
                  Icons.admin_panel_settings,
                  color: ColorManger.white,
                ),
                title: Text(
                  context.translate(AppStrings.admins),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: responsive.setTextSize(3.8)),
                ),
              ),
            ),
            const Spacer(),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {},
                horizontalTitleGap: 25.0,
                leading: Icon(
                  IconlyBold.logout,
                  color: ColorManger.white,
                ),
                title: Text(
                  context.translate(AppStrings.logOut),
                  style: TextStyle(
                    color: ColorManger.white,
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
