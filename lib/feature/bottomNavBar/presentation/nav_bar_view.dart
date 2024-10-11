import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();

    bool isDataLoaded = false;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!isDataLoaded) {
        await Future.wait([
          context.read<BannerCubit>().getBanners(),
          context.read<CategoryCubit>().getCategories(),
          context.read<ProductCubit>().getProduct(),
        ]);

        if (!isAnonymousUser) {
      
          await Future.wait([
            context.read<UserAddressCubit>().getUserAddress(),
            context.read<CartCubit>().getCartItem(),
            context.read<WishListCubit>().getWishList(),
          ]);
        }

        isDataLoaded = true; // Set this to true to prevent re-loading
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLogicCubit, AppLogicState>(
      builder: (context, state) {
        return PersistentTabView(
          avoidBottomPadding: false,
          stateManagement: false,

          controller: context.read<AppLogicCubit>().bottomNavBarController,

          margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),

          backgroundColor: ColorManger.brun,

          screenTransitionAnimation: const ScreenTransitionAnimation(
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),

          onTabChanged: (index) {
            if (index == 2) {
              if (isAnonymousUser) {
              

                Navigator.of(context, rootNavigator: !false)
                    .pushNamed(Routes.noRoute);
              } else {
                Navigator.of(context, rootNavigator: !false)
                    .pushNamed(Routes.cart);
              }

              context.read<AppLogicCubit>().bottomNavBarController.jumpToTab(0);
            }
          },

          tabs: _navBarsItems(),

          navBarBuilder: (navBarConfig) => Style8BottomNavBar(
            navBarConfig: navBarConfig,
            itemAnimationProperties: const ItemAnimation(
              //   // Screen transition animation on change of selected tab.

              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarDecoration: NavBarDecoration(
              color: ColorManger.backgroundItem,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
            ),
          ), // Choose the nav bar style with this property.
        );
      },
    );
  }

  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        screen: const HomeScreen(),
        item: ItemConfig(
          icon: Icon(IconlyBold.home, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.home, size: 20.sp),
          title: (    context.translate(AppStrings.home) ),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: const CategoryView(),
        item: ItemConfig(
          icon: Icon(IconlyBold.category, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.category, size: 20.sp),
          title: (    context.translate(AppStrings.categories)),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: Container(),
        item: ItemConfig(
          icon: Icon(IconlyBold.bag, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.bag, size: 20.sp),
          title: (    context.translate(AppStrings.shopping) ),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => instance<LogOutCubit>(),
            ),
            BlocProvider.value(
              value: instance<PaymentCubit>(),
            ),
          ],
          child: const ProfileView(),
        ),
        item: ItemConfig(
          icon: Icon(IconlyBold.setting, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.setting, size: 20.sp),
          title: (    context.translate(AppStrings.profile) ),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
    ];
  }
}
