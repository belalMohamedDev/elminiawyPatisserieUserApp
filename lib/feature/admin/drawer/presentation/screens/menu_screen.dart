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
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    return Container(
      color: ColorManger.brun,
      child: Padding(
        padding: responsive.setPadding(
          top: isEnLocale ? 20 : 19,
          // left: 1.5,
          // right: 45,
          left: isEnLocale ? 1.5 : 45, 
          right: isEnLocale ? 45 : 2,
          bottom: 8,
        ),
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
                    !isEnLocale,
                  );
                },
                horizontalTitleGap: 25.0,
                leading: Icon(IconlyBold.home, color: ColorManger.white),
                title: Text(
                  context.translate(AppStrings.home),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(3.8),
                  ),
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
                leading: Icon(IconlyBold.category, color: ColorManger.white),
                title: Text(
                  context.translate(AppStrings.categories),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {
                  context.pushNamed(Routes.adminSubCategory);
                },
                horizontalTitleGap: 25.0,
                leading: Icon(Icons.category, color: ColorManger.white),
                title: Text(
                  context.translate(AppStrings.subCategory),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {
                  context.pushNamed(Routes.adminBanner);
                },
                horizontalTitleGap: 25.0,
                leading: Icon(IconlyBold.image, color: ColorManger.white),
                title: Text(
                  context.translate(AppStrings.banners),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {
                  context.pushNamed(Routes.adminProduct);
                },
                horizontalTitleGap: 25.0,
                leading: Image.asset(
                  ImageAsset.dessert,
                  color: ColorManger.white,
                  height: responsive.setHeight(2.4),
                ),
                title: Text(
                  context.translate(AppStrings.products),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {
                  context.pushNamed(Routes.adminDrivers);
                },
                horizontalTitleGap: 25.0,
                leading: Image.asset(
                  ImageAsset.deliveryBike,
                  color: ColorManger.white,
                  height: responsive.setHeight(2.4),
                ),
                title: Text(
                  context.translate(AppStrings.driver),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {
                  context.pushNamed(Routes.storeAddress);
                },
                horizontalTitleGap: 25.0,
                leading: Icon(IconlyBold.location, color: ColorManger.white),
                title: Text(
                    context.translate(AppStrings.storeAddress),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {
                  context.pushNamed(Routes.admin);
                },
                horizontalTitleGap: 25.0,
                leading: Icon(
                  Icons.admin_panel_settings,
                  color: ColorManger.white,
                ),
                title: Text(
                  context.translate(AppStrings.admins),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {
                  context.pushNamed(Routes.profileScreen);
                },
                horizontalTitleGap: 25.0,
                leading: Icon(IconlyBold.setting, color: ColorManger.white),
                title: Text(
                  context.translate(AppStrings.settings),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
            const Spacer(),
            BlocConsumer<LogOutCubit, LogOutState>(
              listener: (context, state) async {
                if (state is LogOutSuccess) {
                  ShowToast.showToastSuccessTop(
                    message: state.successMessage,
                    context: context,
                  );
                  await AppLogout().logOutThenNavigateToLogin();
                } else if (state is LogOutError) {
                  ShowToast.showToastErrorTop(
                    errorMessage: state.apiErrorModel.message!,
                    context: context,
                  );
                  if (state.apiErrorModel.statusCode == 400) {
                    await AppLogout().logOutThenNavigateToLogin();
                  }
                }
              },
              builder: (context, state) {
                return Material(
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: () async {
                      context.read<LogOutCubit>().checkTokenThenDoLogOut(
                        context,
                      );
                    },
                    horizontalTitleGap: 25.0,
                    leading: Icon(IconlyBold.logout, color: ColorManger.white),
                    title: state is LogOutLoading
                        ? SizedBox(
                            height: responsive.setHeight(3.8),
                            width: responsive.setWidth(3.8),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            context.translate(AppStrings.logOut),
                            style: TextStyle(
                              color: ColorManger.white,
                              fontSize: responsive.setTextSize(3.8),
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
