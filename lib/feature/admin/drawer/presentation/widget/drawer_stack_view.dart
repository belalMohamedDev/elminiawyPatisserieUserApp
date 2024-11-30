import 'package:elminiawy/feature/admin/home/presentation/screen/home_admin_screen.dart';
import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/drawer/presentation/widget/animated_container_widget.dart';

import '../screens/menu_screen.dart';

class DrawerStackView extends StatelessWidget {
  const DrawerStackView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Scaffold(
      body: Stack(
        children: [
          const DrawerScreen(),
          AnimatedContainerWidget(
              xOffset: responsive.setWidth(35),
              yOffset: responsive.setHeight(20),
              rotate: 269.98,
              scaleFactor: 0.72,
              color: Colors.white30),
          AnimatedContainerWidget(
              xOffset: responsive.setWidth(45),
              yOffset: responsive.setHeight(13),
              rotate: 270,
              scaleFactor: 0.8,
              color: Colors.white54),
          const AdminHomeScreen(),
        ],
      ),
    );
  }
}