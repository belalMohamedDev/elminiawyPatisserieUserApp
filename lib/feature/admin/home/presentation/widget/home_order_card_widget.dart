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
    return Container(
        height: 130,
        width: 170,
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 10, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                color: cardContentColor,
                height: 32,
              ),
              Text(
                title,
                style: TextStyle(color: cardContentColor, fontSize: 15),
              ),
              Text(
                number,
                style: TextStyle(color: cardContentColor, fontSize:isSalesToday?18: 25),
              )
            ],
          ),
        ));
  }
}
