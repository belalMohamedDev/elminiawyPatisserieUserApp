import '../../../../../core/common/shared/shared_imports.dart';

class HomeOrderCardWidget extends StatelessWidget {
  const HomeOrderCardWidget({
    super.key,
    required this.title,
    required this.number,
    required this.image,
    required this.cardColor,
    required this.cardContentColor,
    this.isSalesToday =false
  });

  final String title;
  final Color cardColor;
  final String number;
  final Color cardContentColor;
  final String image;

  final bool isSalesToday;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Container(
        height: responsive.setHeight(15),
        width: responsive.setWidth(43.5),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(responsive.setBorderRadius(3.8))),
        child: Padding(
          padding: responsive.setPadding(top: 2, left: 4,bottom: 1.5),


          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                color: cardContentColor,
                height: responsive.setHeight(4),
              ),
              Text(
                title,
                style: TextStyle(color: cardContentColor, fontSize: responsive.setTextSize(4)),
              ),
              Text(
                number,
                style: TextStyle(color: cardContentColor, fontSize:responsive.setTextSize(isSalesToday?4:5)),
              )
            ],
          ),
        ));
  }
}
