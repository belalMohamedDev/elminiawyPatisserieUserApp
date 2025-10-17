import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/home/presentation/widget/home_app_bar.dart';

import '../widget/home_orders.dart';
import '../widget/home_sales.dart';

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
              child: Stack(
                children: [
                  RefreshIndicator(
                    color: ColorManger.brun,
                    backgroundColor: ColorManger.backgroundItem,
                    strokeWidth: 3,
                    onRefresh: () async {
                      await context
                          .read<AdminHomeCubit>()
                          .getOrdersStatusAndSalesTodayCountSummit();
                    },
                    child: ListView(
                      children: [
                        HomeAppBar(adminHomeCubit: adminHomeCubit),
                        HomeOrders(adminHomeCubit: adminHomeCubit),
                        Padding(
                          padding: responsive.setPadding(
                              left: 4, top: 1.5, right: 4),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.pushNamed(Routes.cancelledOrders);
                                },
                                child: SalesContainerWidget(
                                    image: ImageAsset.orderCancel,
                                    titleText: "Cancelled Orders",
                                    bodyText:
                                        "${context.read<AdminHomeCubit>().getOrdersStatusAndSalesTodayCount?.data!.cancelledOrders ?? 0}"),
                              ),
                              const Spacer(),
                              SalesContainerWidget(
                                  image: ImageAsset.user,
                                  titleText: "Top Customers",
                                  bodyText:
                                      "${context.read<AdminHomeCubit>().getOrdersStatusAndSalesTodayCount?.data!.totalSalesLastWeek ?? 0}"),
                              const Spacer(),
                              SalesContainerWidget(
                                  image: ImageAsset.dessert,
                                  titleText: "Top Products",
                                  bodyText:
                                      "${context.read<AdminHomeCubit>().getOrdersStatusAndSalesTodayCount?.data!.totalItemsSoldLastWeek ?? 0}"),
                            ],
                          ),
                        ),
                        const HomeSales(),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 30,
                    bottom: 60,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: instance<CategoryCubit>(),
                                child: const CategoryView(
                                  isCategoryCartToAdmin: true,
                                ),
                              ),
                            ));
                      },
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
