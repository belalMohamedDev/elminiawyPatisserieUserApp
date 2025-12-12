import '../../../../../core/common/shared/shared_imports.dart';

class HomeOrderCardWidget extends StatelessWidget {
  const HomeOrderCardWidget({
    super.key,
    required this.title,
    required this.number,
    required this.image,
    required this.cardColor,
    required this.cardContentColor,
    this.isSalesToday = false,
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
      height: responsive.setHeight(20),
      width: responsive.setWidth(44.5),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(responsive.setBorderRadius(3)),
      ),
      child: Padding(
        padding: responsive.setPadding(top: 2, left: 4, bottom: 1.5, right: 4),
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
              style: TextStyle(
                color: cardContentColor,
                fontSize: responsive.setTextSize(4),
              ),
            ),
            Text(
              number,
              style: TextStyle(
                color: cardContentColor,
                fontSize: responsive.setTextSize(isSalesToday ? 4 : 5),
              ),
            ),
            Container(
              height: responsive.setHeight(4),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManger.white.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(
                  responsive.setBorderRadius(1),
                ),
              ),
              child: Center(
                child: Text(
                  context.translate(AppStrings.view),
                  style: TextStyle(
                    color: cardContentColor,
                    fontSize: responsive.setTextSize(3.8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
