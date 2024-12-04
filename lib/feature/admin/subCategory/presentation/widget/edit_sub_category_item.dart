import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:flutter/cupertino.dart';

void showEditAndCreateSubCategoryDialog(
    BuildContext context,
    SubCategoryResponseData? subCategory,
    SubCategoriesCubit subCategoryCubit,
    CategoryCubit categoryCubit) {
  final responsive = ResponsiveUtils(context);

  showCupertinoDialog(
    context: context,
    builder: (_) => BlocProvider(
      create: (context) => instance<SubCategoriesCubit>(),
      child: CupertinoAlertDialog(
        title: Text(
            subCategory == null
                ? "${context.translate(AppStrings.addNew)} ${context.translate(AppStrings.subCategory)}"
                : "${context.translate(AppStrings.update)} ${subCategory.title} ${context.translate(AppStrings.category)}",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: responsive.setTextSize(3.5))),
        content: Column(
          children: [
            responsive.setSizeBox(height: 2),
            CupertinoTextField(
              controller: subCategoryCubit.arTitleController,
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
              controller: subCategoryCubit.enTitleController,
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
              value: subCategory == null
                  ? "Add New Sub Category"
                  : subCategory.title,
              items: categoryCubit.categoriesTitle,
              onChanged: (value) {
                String? categoryId = categoryCubit.returnCategoryIdType(value!);
                subCategoryCubit.setCategoryId(categoryId!);
              },
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
              if (subCategory != null) {
                subCategoryCubit.fetchUpdateSubCategories(
                  id: subCategory.sId,
                );
              } else {
                subCategoryCubit.fetchCreationNewSubCategory();
              }
            },
            child: Text(
                subCategory != null
                    ? context.translate(AppStrings.update)
                    : context.translate(AppStrings.addNew),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: responsive.setTextSize(4.2))),
          ),
        ],
      ),
    ),
  );
}
