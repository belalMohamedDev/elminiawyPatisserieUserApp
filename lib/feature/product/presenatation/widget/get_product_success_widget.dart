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
            showProductEditPopup(
              product,
              context,
            );
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
            context.read<ProductCubit>().pickImage(
                  ImageSource.gallery,
                  product.sId,
                );
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

void showProductEditPopup(DataProductResponse product, BuildContext context) {
  final responsive = ResponsiveUtils(context);

  showCupertinoModalPopup(
    context: context,
    builder: (_) => CupertinoActionSheet(
      title: Text(
          "${product.title} ${context.translate(AppStrings.subCategory)}",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: responsive.setTextSize(3.5))),
      message: Column(
        children: [
          responsive.setSizeBox(height: 2),
          CupertinoTextField(
            controller: context.read<ProductCubit>().arTitleController,
            placeholder: context.translate(AppStrings.enterArabicTitle),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: responsive.setTextSize(3.5)),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 0.6,
              ),
            ),
          ),
          responsive.setSizeBox(height: 2),
          CupertinoTextField(
            controller: context.read<ProductCubit>().enTitleController,
            placeholder: context.translate(AppStrings.enterEnglishTitle),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: responsive.setTextSize(3.5)),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 0.6,
              ),
            ),
          ),
          responsive.setSizeBox(height: 2),
          CupertinoTextField(
            controller: context.read<ProductCubit>().arDescriptionController,
            placeholder: context.translate(AppStrings.enterArabicDescription),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: responsive.setTextSize(3.5)),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 0.6,
              ),
            ),
          ),
          responsive.setSizeBox(height: 2),
          CupertinoTextField(
            controller: context.read<ProductCubit>().enDescriptionController,
            placeholder: context.translate(AppStrings.enterEnglishDescription),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: responsive.setTextSize(3.5)),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 0.6,
              ),
            ),
          ),
          responsive.setSizeBox(height: 2),
          CupertinoTextField(
            controller: context.read<ProductCubit>().priceController,
            placeholder: context.translate(AppStrings.enterPrice),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: responsive.setTextSize(3.5)),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 0.6,
              ),
            ),
          ),
          responsive.setSizeBox(height: 2),
          CustomDropdownButtonFormField(
            value: "Add New Sub Category",
            items: context.read<SubCategoriesCubit>().subCategoriesTitle,
            onChanged: (value) {
              String? subCategoryId = context
                  .read<SubCategoriesCubit>()
                  .returnSubCategoryIdType(value!);

              context.read<ProductCubit>().setSubCategoryId(subCategoryId!);
            },
          ),
          responsive.setSizeBox(height: 1),
        ],
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            context.read<ProductCubit>().fetchUpdateProduct(id: product.sId!);
            Navigator.pop(context);
          },
          child: Text(
            context.translate(AppStrings.save),
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
