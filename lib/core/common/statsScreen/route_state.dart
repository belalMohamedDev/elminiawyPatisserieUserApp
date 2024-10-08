import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class RouteStatesScreen extends StatelessWidget {
  const RouteStatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: AspectRatio(
                aspectRatio: 1,
                child: SvgPicture.asset(
                  ImageAsset.noRoute,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ErrorInfo(
              title: AppStrings.youAreNotLoggedIn,
              description: AppStrings
                  .pleaseLoginToContinueAndEnjoyFullAccessToTheAppFeatures,
              btnText: AppStrings.logIn,
              press: () async {
                Navigator.of(context, rootNavigator: !false)
                    .pushNamedAndRemoveUntil(
                        Routes.loginRoute, (Route route) => false);

                context
                    .read<AppLogicCubit>()
                    .bottomNavBarController
                    .jumpToTab(0);

                await SharedPrefHelper.clearAllSecuredData();

                SharedPrefHelper.setData(PrefKeys.prefsKeyAnonymousUser, false);
                SharedPrefHelper.removeData(PrefKeys.locationArea);
                SharedPrefHelper.removeData(PrefKeys.longAddressHome);
                SharedPrefHelper.removeData(PrefKeys.latAddressHome);
              },
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
