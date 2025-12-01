import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/home/presentation/widget/home_sales.dart';

class DriverOrder extends StatelessWidget {
  const DriverOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return BlocBuilder<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
           final adminHomeCubit = context.watch<AdminHomeCubit>();
        return Padding(
          padding: responsive.setPadding(left: 4, top: 1.5, right: 4),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.pendingDrivers);
                },
                child: SalesContainerWidget(
                    image: ImageAsset.driver,
                    titleText: "Pending Driver",
                    bodyText:
                        "${adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.pendingDriver ?? 0}"),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.cancelledOrders);
                },
                child: SalesContainerWidget(
                    image: ImageAsset.deliveryCancelled,
                    titleText: "Cancelled Orders",
                    imageColor: const Color(0xffe68636).withValues(alpha: 0.9),
                    bodyText:
                        "${adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.cancelledOrders ?? 0}"),
              ),
              const Spacer(),
              SalesContainerWidget(
                  image: ImageAsset.cakeBox,
                  titleText: "Top Products",
                  bodyText:
                      "${adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.topProducts ?? 0}"),
            ],
          ),
        );
      },
    );
  }
}
