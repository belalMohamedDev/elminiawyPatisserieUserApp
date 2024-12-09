import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:flutter/cupertino.dart';

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
            value: context.translate(AppStrings.addNewSubCategory),
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
