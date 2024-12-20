import 'package:elminiawy/core/common/shared/shared_imports.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
   
      context.read<AppLogicCubit>().stream.listen((locale) async {
        await Future.wait([
          context.read<BannerCubit>().getBanners(endDate: "true"),
          context.read<CategoryCubit>().getCategories(active: 'true'),
          context.read<ProductCubit>().fetchGetNewProductToUser(),
        ]);
        if (AppInitialRoute.isAnonymousUser == false) {
          await Future.wait([
            context.read<UserAddressCubit>().getUserAddress(),
            context.read<CartCubit>().getCartItem(),
            context.read<WishListCubit>().getWishList(),
          ]);
        }
      });

      await Future.wait([
        context.read<BannerCubit>().getBanners(endDate: "true"),
        context.read<CategoryCubit>().getCategories(active: 'true'),
        context.read<ProductCubit>().fetchGetNewProductToUser(),
      ]);

      if (AppInitialRoute.isAnonymousUser == false) {
        await Future.wait([
          context.read<UserAddressCubit>().getUserAddress(),
          context.read<CartCubit>().getCartItem(),
          context.read<WishListCubit>().getWishList(),
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<AppLogicCubit, AppLogicState>(
      builder: (context, state) {
        return PersistentTabView(
          avoidBottomPadding: false,
          stateManagement: false,
          controller: context.read<AppLogicCubit>().bottomNavBarController,

          margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),

          backgroundColor: ColorManger.brun,

          tabs: _navBarsItems(responsive),

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

  List<PersistentTabConfig> _navBarsItems(ResponsiveUtils responsive) {
    return [
      PersistentTabConfig(
        screen: const HomeScreen(),
        item: ItemConfig(
          icon: Icon(IconlyBold.home, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.home, size: 20.sp),
          title: (context.translate(AppStrings.home)),
          textStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: responsive.setTextSize(3.5)),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: const CategoryView(),
        item: ItemConfig(
          icon: Icon(IconlyBold.category, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.category, size: 20.sp),
          title: (context.translate(AppStrings.categories)),
          textStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: responsive.setTextSize(3.5)),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: const WishListView(),
        item: ItemConfig(
          icon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Icon(IconlyBold.heart, size: 20.sp),
          ),
          inactiveIcon: Icon(IconlyBroken.heart, size: 20.sp),
          title: (context.translate(AppStrings.wishList)),
          textStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: responsive.setTextSize(3.5)),
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
            BlocProvider(
              create: (context) =>
                  instance<AuthenticationWithGoogleAndAppleCubit>(),
            ),
          ],
          child: const ProfileView(),
        ),
        item: ItemConfig(
          icon: Icon(IconlyBold.setting, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.setting, size: 20.sp),
          title: (context.translate(AppStrings.profile)),
          textStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: responsive.setTextSize(3.5)),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
    ];
  }
}
