import 'package:elminiawy/core/common/shared/shared_imports.dart';

class TitleDescriptionTextAndRatingColumn extends StatelessWidget {
  const TitleDescriptionTextAndRatingColumn({
    super.key,
    required this.product,
  });

  final DataProductResponse product;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return SizedBox(
      width: responsive.setWidth(26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(product.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: responsive.setTextSize(3))),
          responsive.setSizeBox(height: 1),
          IgnorePointer(
            ignoring: true,
            child: RatingBar(
                initialRating: product.ratingsAverage!,
                direction: Axis.horizontal,
                itemSize: responsive.setIconSize(4),
                itemCount: 5,
                allowHalfRating: true,
                itemPadding: responsive.setPadding(left: 0.2, right: 0.2),
                onRatingUpdate: (rating) {},
                ratingWidget: RatingWidget(
                    full: Icon(
                      IconlyBold.star,
                      color: ColorManger.brown,
                    ),
                    half: Icon(
                      IconlyBold.star,
                      color: ColorManger.brun,
                    ),
                    empty: Icon(
                      IconlyBroken.star,
                      color: ColorManger.brunLight,
                    ))),
          ),
          responsive.setSizeBox(height: 1),
          Text(product.description!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: responsive.setTextSize(3))),
        ],
      ),
    );
  }
}
