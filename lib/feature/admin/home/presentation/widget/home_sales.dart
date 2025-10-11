import '../../../../../core/common/shared/shared_imports.dart';

class HomeSales extends StatelessWidget {
  const HomeSales({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return BlocBuilder<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
        return Padding(
          padding: responsive.setPadding(left: 4, top: 1.5, right: 4),
          child: Row(
            children: [
              _salesWidget(responsive, context, ImageAsset.money, "Sales Today",
                  "${context.read<AdminHomeCubit>().getOrdersStatusAndSalesTodayCount?.data!.totalSalesToday ?? 0} EGP"),
              const Spacer(),
              _salesWidget(
                  responsive,
                  context,
                  ImageAsset.increase,
                  "Sales Week",
                  "${context.read<AdminHomeCubit>().getOrdersStatusAndSalesTodayCount?.data!.totalSalesLastWeek ?? 0} EGP"),
              const Spacer(),
              _salesWidget(
                  responsive,
                  context,
                  ImageAsset.groceries,
                  "Products sold",
                  "${context.read<AdminHomeCubit>().getOrdersStatusAndSalesTodayCount?.data!.totalItemsSoldLastWeek ?? 0}"),
            ],
          ),
        );
      },
    );
  }

  Container _salesWidget(ResponsiveUtils responsive, BuildContext context,
      String image, String titleText, String bodyText) {
    return Container(
      height: responsive.setHeight(12),
      width: responsive.setWidth(29),
      decoration: BoxDecoration(
        color: ColorManger.brownLight.withOpacity(0.09),
        borderRadius: BorderRadius.circular(responsive.setBorderRadius(2)),
      ),
      child: Padding(
        padding: responsive.setPadding(
          left: 2,
          top: 0.5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: responsive.setHeight(4),
            ),
            responsive.setSizeBox(height: 1),
            Text(
              titleText,
              style: getSemiBoldStyle(
                color: ColorManger.brun,
                fontSize: responsive.setTextSize(3.5),
              ),
            ),
            responsive.setSizeBox(height: 0.5),
            Text(
              bodyText,
              style: getSemiBoldStyle(
                color: ColorManger.brunLight,
                fontSize: responsive.setTextSize(3.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
