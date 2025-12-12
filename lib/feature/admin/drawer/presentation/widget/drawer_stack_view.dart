import 'package:elminiawy/core/common/shared/shared_imports.dart';

class DrawerStackView extends StatelessWidget {
  const DrawerStackView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    return BlocListener<AppLogicCubit, AppLogicState>(
      listener: (context, state) {
        if (state is LanguageChangeState && AppInitialRoute.role == "admin") {
          final isRtl = state.locale.languageCode == 'ar';

          context.read<AdminHomeCubit>().drawerOpenOrClose(
            0,
            0,
            1,
            0,
            false,
            isRtl,
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const DrawerScreen(),
            AnimatedContainerWidget(
              xOffset: responsive.setWidth(isEnLocale ? 35 : -37),
              yOffset: responsive.setHeight(isEnLocale ? 20 : 16),
              rotate: 269.98,
              scaleFactor: 0.72,
              color: Colors.white30,
            ),
            AnimatedContainerWidget(
              xOffset: responsive.setWidth(isEnLocale ? 45 : -52),
              yOffset: responsive.setHeight(isEnLocale ? 13 : 11),
              rotate: 270,
              scaleFactor: 0.8,
              color: Colors.white54,
            ),
            const AdminHomeScreen(),
          ],
        ),
      ),
    );
  }
}
