import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late String initialUserName;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      initialUserName =
          await SharedPrefHelper.getSecuredString(PrefKeys.userName);

      await Future.wait([
        context.read<BannerCubit>().getBanners(),
        context.read<CategoryCubit>().getCategories(),
        context.read<ProductCubit>().getProduct(),
      ]);

      await Future.wait([
        if (initialUserName.isNotEmpty) ...[
          context.read<UserAddressCubit>().getUserAddress(),
          context.read<CartCubit>().getCartItem(),
          context.read<WishListCubit>().getWishList(),
        ],
      ]);
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
              if (initialUserName.isEmpty) {
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
          title: (AppStrings.home),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: const CategoryView(),
        item: ItemConfig(
          icon: Icon(IconlyBold.category, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.category, size: 20.sp),
          title: (AppStrings.categories),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: Container(),
        item: ItemConfig(
          icon: Icon(IconlyBold.bag, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.bag, size: 20.sp),
          title: (AppStrings.shopping),
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
          title: (AppStrings.profile),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
    ];
  }
}
