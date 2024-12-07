import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/product/presenatation/widget/title_description_text_and_rating_column.dart';

class GetProductSuccessWidget extends StatelessWidget {
  const GetProductSuccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    final products = context.read<ProductCubit>().allProduct;
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: responsive.setPadding(bottom: 1, left: 2.5, right: 2.5),
            child: Container(
              width: double.infinity,
              height: responsive.setHeight(10),
              decoration: BoxDecoration(
                color: ColorManger.backgroundItem,
                borderRadius:
                    BorderRadius.circular(responsive.setBorderRadius(3)),
              ),
              child: Row(
                children: [
                  responsive.setSizeBox(width: 2.5),
                  Container(
                    width: responsive.setWidth(18),
                    decoration: BoxDecoration(
                      color: ColorManger.brownLight,
                      borderRadius:
                          BorderRadius.circular(responsive.setBorderRadius(3)),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: products[index].image ?? '',
                      height: responsive.setHeight(8),
                      width: responsive.setWidth(18),
                      placeholder: (context, url) => Image.asset(
                        ImageAsset.picture,
                        height: responsive.setHeight(8),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: ColorManger.brun,
                      ),
                    ),
                  ),
                  responsive.setSizeBox(width: 3),
                  TitleDescriptionTextAndRatingColumn(
                    product: products[index],
                  ),
                  responsive.setSizeBox(width: 5),
                  Container(
                    height: responsive.setHeight(6),
                    width: responsive.setWidth(12),
                    decoration: BoxDecoration(
                      color: ColorManger.brownLight,
                      borderRadius:
                          BorderRadius.circular(responsive.setBorderRadius(3)),
                    ),
                    child: Center(
                      child: Text('${products[index].price}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: responsive.setTextSize(3))),
                    ),
                  ),
                  responsive.setSizeBox(width: 3),
                  Container(
                    height: responsive.setHeight(6),
                    width: responsive.setWidth(12),
                    decoration: BoxDecoration(
                      color: ColorManger.brownLight,
                      borderRadius:
                          BorderRadius.circular(responsive.setBorderRadius(3)),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.edit,
                      color: ColorManger.brun,
                    )),
                  ),
                  responsive.setSizeBox(width: 3),
                  Container(
                    height: responsive.setHeight(6),
                    width: responsive.setWidth(12),
                    decoration: BoxDecoration(
                      color: products[index].active == true
                          ? Colors.green
                          : ColorManger.redError,
                      borderRadius:
                          BorderRadius.circular(responsive.setBorderRadius(3)),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.delete_outline_rounded,
                      color: ColorManger.white,
                    )),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
