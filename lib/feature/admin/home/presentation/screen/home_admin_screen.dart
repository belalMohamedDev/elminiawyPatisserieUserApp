import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return BlocBuilder<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
        final adminHomeCubit = context.read<AdminHomeCubit>();
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: adminHomeCubit.drawerIsOpen
                  ? ColorManger.brun
                  : ColorManger.white),
          child: GestureDetector(
            onTap: () {
              if (adminHomeCubit.drawerIsOpen) {
                adminHomeCubit.drawerOpenOrClose(
                  0,
                  0,
                  1,
                  0,
                  false,
                );
              }
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(adminHomeCubit.drawerIsOpen ? 50 : 0),
                color: ColorManger.white,
              ),
              transform: Matrix4.translationValues(
                  adminHomeCubit.xOffset, adminHomeCubit.yOffset, 0)
                ..rotateZ(adminHomeCubit.rotate)
                ..scale(adminHomeCubit.scaleFactor),
              duration: const Duration(milliseconds: 250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: responsive.setPadding(top: 5, left: 4),
                    child: adminHomeCubit.drawerIsOpen
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
          ),
        );
      },
    );
  }
}
