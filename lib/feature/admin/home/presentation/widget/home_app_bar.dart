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
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: ColorManger.brun,
                ))
          ],
        ));
  }
}
