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
        final adminHomeCubit = context.read<AdminHomeCubit>();
        return Padding(
          padding: responsive.setPadding(left: 4, top: 1.5, right: 4),
          child: Row(
            children: [
              SalesContainerWidget(
                  image: ImageAsset.money,
                  titleText: "Sales Today",
                  bodyText:
                      "${adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.totalSalesToday ?? 0} EGP"),
              const Spacer(),
              SalesContainerWidget(
                  image: ImageAsset.increase,
                  titleText: "Sales Week",
                  bodyText:
                      "${adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.totalSalesLastWeek ?? 0} EGP"),
              const Spacer(),
              SalesContainerWidget(
                  image: ImageAsset.groceries,
                  titleText: "Products sold",
                  bodyText:
                      "${adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.totalItemsSoldLastWeek ?? 0}"),
            ],
          ),
        );
      },
    );
  }
}

class SalesContainerWidget extends StatelessWidget {
  const SalesContainerWidget({
    super.key,
    required this.image,
    required this.titleText,
    required this.bodyText,
    this.imageColor,
  });

  final String image;
  final String titleText;
  final String bodyText;
  final Color? imageColor;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
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
          top: 0.9,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: responsive.setHeight(4),
              color: imageColor,
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
