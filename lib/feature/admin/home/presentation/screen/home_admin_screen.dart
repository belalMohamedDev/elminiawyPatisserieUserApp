import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/home/presentation/widget/home_app_bar.dart';

import '../widget/home_orders.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
   // final responsive = ResponsiveUtils(context);
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
              child: Stack(
                children: [
                  Column(
                    children: [
                      HomeAppBar(adminHomeCubit: adminHomeCubit),
                      HomeOrders(adminHomeCubit: adminHomeCubit)
                    ],
                  ),
                  Positioned(
                    right: 30,
                    bottom: 60,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: ColorManger.brun,
                      child: Icon(Icons.add, color: ColorManger.backgroundItem),
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
