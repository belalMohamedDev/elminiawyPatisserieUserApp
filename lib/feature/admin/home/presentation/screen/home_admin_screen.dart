import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double rotate = 0.0;
  double scaleFactor = 1;
  bool drawerIsOpen = false;
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: drawerIsOpen ? ColorManger.brun : ColorManger.white),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(drawerIsOpen ? 50 : 0),
          color: ColorManger.white,
        ),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..rotateZ(rotate)
          ..scale(scaleFactor),
        duration: const Duration(milliseconds: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: responsive.setPadding(top: 5, left: 4),
              child: drawerIsOpen
                  ? Container(
                      decoration: BoxDecoration(
                          color: ColorManger.brun,
                          borderRadius: BorderRadius.circular(
                              responsive.setBorderRadius(3))),
                      child: IconButton(
                          onPressed: () {
                            xOffset = 0;
                            yOffset = 0;
                            rotate = 0;
                            scaleFactor = 1;
                            drawerIsOpen = false;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: ColorManger.white,
                          )),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: ColorManger.brun,
                          borderRadius: BorderRadius.circular(
                              responsive.setBorderRadius(2))),
                      child: IconButton(
                          onPressed: () {
                            xOffset = responsive.setWidth(60);
                            yOffset = responsive.setHeight(8);
                            scaleFactor = 0.85;

                            rotate = 270.05;

                            drawerIsOpen = true;
                            setState(() {});
                          },
                          icon: Image.asset(ImageAsset.menu,
                              height: responsive.setHeight(2.8),
                              color: ColorManger.white)),
                    ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20, top: 240),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
