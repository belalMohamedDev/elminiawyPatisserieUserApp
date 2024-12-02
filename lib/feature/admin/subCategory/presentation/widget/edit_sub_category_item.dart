import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/core/common/sharedWidget/custom_dropdown_button_form_field.dart';
import 'package:flutter/cupertino.dart';

void showEditAndCreateSubCategoryDialog(BuildContext context,
    SubCategoryResponseData subCategory, SubCategoriesCubit subCategoryCuibt) {
  final responsive = ResponsiveUtils(context);

  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(
          "${context.translate(AppStrings.update)} ${subCategory.title} ${context.translate(AppStrings.category)}",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: responsive.setTextSize(3.5))),
      content: Column(
        children: [
          responsive.setSizeBox(height: 2),
          CupertinoTextField(
            controller: subCategoryCuibt.arTitleController,
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
            controller: subCategoryCuibt.enTitleController,
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
          CustomDropdownButtonFormField(
            value: subCategory.title,
            items: const ["", "", "", ""],
          ),
          responsive.setSizeBox(height: 1),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            context.translate(AppStrings.cancel),
            style:
                TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
              context.translate(
                AppStrings.update,
              ),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: responsive.setTextSize(4.2))),
        ),
      ],
    ),
  );
}
