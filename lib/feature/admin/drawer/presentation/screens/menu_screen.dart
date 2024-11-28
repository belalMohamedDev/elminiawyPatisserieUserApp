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
            responsive.setPadding(top: 23, left: 1.5, right: 45, bottom: 8),
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              child: ListTile(
                splashColor: ColorManger.white,
                onTap: () {},
                horizontalTitleGap: 25.0,
                leading: Icon(
                  IconlyBold.home,
                  color: ColorManger.white,
                ),
                title: Text(
                  AppStrings.home,
                  style: TextStyle(
                    color: ColorManger.white,
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {},
                horizontalTitleGap: 25.0,
                leading: Icon(
                  IconlyBold.category,
                  color: ColorManger.white,
                ),
                title: Text(
                  AppStrings.category,
                  style: TextStyle(
                    color: ColorManger.white,
                    fontSize: responsive.setTextSize(3.8),
                  ),
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
                  "SubCategory",
                  style: TextStyle(
                    color: ColorManger.white,
                    fontSize: responsive.setTextSize(3.8),
                  ),
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
                  "Banner",
                  style: TextStyle(
                    color: ColorManger.white,
                    fontSize: responsive.setTextSize(3.8),
                  ),
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
                  "Product",
                  style: TextStyle(
                    color: ColorManger.white,
                    fontSize: responsive.setTextSize(3.8),
                  ),
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
                  "Orders",
                  style: TextStyle(
                    color: ColorManger.white,
                    fontSize: responsive.setTextSize(3.8),
                  ),
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
                  "Driver",
                  style: TextStyle(
                    color: ColorManger.white,
                    fontSize: responsive.setTextSize(3.8),
                  ),
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
                  "Users",
                  style: TextStyle(
                    color: ColorManger.white,
                    fontSize: responsive.setTextSize(3.8),
                  ),
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
                  AppStrings.logOut,
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
