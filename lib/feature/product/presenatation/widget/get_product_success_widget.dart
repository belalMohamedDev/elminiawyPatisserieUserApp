import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/product/presenatation/widget/title_description_text_and_rating_column.dart';
import 'package:flutter/cupertino.dart';

class GetProductSuccessWidget extends StatelessWidget {
  const GetProductSuccessWidget({
    super.key,
    required this.state,
  });
  final ProductState state;
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
                  InkWell(
                    onTap: () {
                      showEditProductActionDialog(context, products[index]);
                    },
                    child: Container(
                        height: responsive.setHeight(6),
                        width: responsive.setWidth(12),
                        decoration: BoxDecoration(
                          color: ColorManger.brownLight,
                          borderRadius: BorderRadius.circular(
                              responsive.setBorderRadius(3)),
                        ),
                        child: Center(
                            child: Icon(
                          Icons.edit,
                          color: ColorManger.brun,
                        ))),
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

void showEditProductActionDialog(
  BuildContext context,
  DataProductResponse product,
) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => CupertinoActionSheet(
      title: Text(
        context.translate(AppStrings.actions),
        style: TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            // showEditPopup(
            //   category,
            //   context,
            // );
          },
          child: Text(
            context.translate(AppStrings.edit),
            style:
                TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            // context.read<CategoryCubit>().pickImage(
            //       ImageSource.gallery,
            //       category.sId,
            //     );
          },
          child: Text(
            context.translate(AppStrings.editImage),
            style:
                TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
          ),
          // const Text('Edit Image'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            context.read<ProductCubit>().fetchUpdateProduct(
                  id: product.sId!,
                  active: !product.active!,
                );
          },
          child: Text(
            product.active == true
                ? context.translate(AppStrings.deActive)
                : context.translate(AppStrings.active),
            style:
                TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          context.translate(AppStrings.cancel),
          style: TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
        ),
      ),
    ),
  );
}
