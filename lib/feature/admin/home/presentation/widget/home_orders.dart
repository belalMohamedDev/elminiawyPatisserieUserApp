import '../../../../../core/common/shared/shared_imports.dart';
import 'home_order_card_widget.dart';

class HomeOrders extends StatelessWidget {
  const HomeOrders({
    super.key, required this.adminHomeCubit,
  });
  final AdminHomeCubit adminHomeCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 30),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {

                    context.pushNamed(Routes.newOrders);
                  },
                  child: HomeOrderCardWidget(
                    title: "New Orders",
                    number: '12',
                    image: ImageAsset.order,
                    cardContentColor: ColorManger.backgroundItem,
                    cardColor: ColorManger.brun,
                  ),
                ),
                const Spacer(),
                HomeOrderCardWidget(
                  title: "Completed Orders",
                  number: '8',
                  image: ImageAsset.orderDelivered,
                  cardContentColor: ColorManger.brun,
                  cardColor: ColorManger.brownLight,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 10),
            child: Row(
              children: [
                HomeOrderCardWidget(
                  title: "Cancelled Orders",
                  number: '2',
                  image: ImageAsset.orderCancel,
                  cardContentColor: ColorManger.brun,
                  cardColor: ColorManger.brownLight,
                ),
                const Spacer(),
                HomeOrderCardWidget(
                  title: "Sales Today",
                  number: "1500 EGP",
                  image: ImageAsset.checkOut,
                  cardContentColor: ColorManger.backgroundItem,
                  cardColor: ColorManger.brunLight,
                  isSalesToday: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

