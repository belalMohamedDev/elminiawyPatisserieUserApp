import '../../../../../core/common/shared/shared_imports.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.adminHomeCubit,
  });

  final AdminHomeCubit adminHomeCubit;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Padding(
        padding: responsive.setPadding(left: 4.5, right: 2),
        child: Row(
          children: [
            adminHomeCubit.drawerIsOpen
                ? Container(
                    decoration: BoxDecoration(
                        color: ColorManger.brun,
                        borderRadius: BorderRadius.circular(
                            responsive.setBorderRadius(3))),
                    child: IconButton(
                        onPressed: () {
                          adminHomeCubit.drawerOpenOrClose(
                            0,
                            0,
                            1,
                            0,
                            false,
                          );
                        },
                        icon: Icon(
                          IconlyBold.arrowRight,
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
                          adminHomeCubit.drawerOpenOrClose(
                              responsive.setWidth(60),
                              responsive.setHeight(8),
                              0.85,
                              270.05,
                              true);
                        },
                        icon: Image.asset(ImageAsset.menu,
                            height: responsive.setHeight(3.5),
                            color: ColorManger.white)),
                  ),
            const Spacer(),
            Text(
              "Sweet Shop Admin",
              style: TextStyle(color: ColorManger.brun, fontSize: 18),
            ),
            const Spacer(),
            // IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.notifications,
            //       color: ColorManger.brun,
            //     ))

            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.cart);
              },
              child: Container(
                height: responsive.setHeight(4.5),
                width: responsive.setWidth(9.8),
                decoration: BoxDecoration(
                    color: ColorManger.brownLight,
                    borderRadius:
                        BorderRadius.circular(responsive.setBorderRadius(5))),
                child: Icon(
                  IconlyBold.bag,
                  color: ColorManger.brun,
                ),
              ),
            ),

            responsive.setSizeBox(width: 1),

            IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: !false)
                    .pushNamed(Routes.notification);
              },
              icon: Container(
                height: responsive.setHeight(4.5),
                width: responsive.setWidth(9.8),
                decoration: BoxDecoration(
                    color: ColorManger.brownLight,
                    borderRadius:
                        BorderRadius.circular(responsive.setBorderRadius(5))),
                child: Icon(
                  IconlyBold.notification,
                  color: ColorManger.brun,
                ),
              ),
            )
          ],
        ));
  }
}
