import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:flutter/cupertino.dart';

void showEditPopup(CategoryResponseData category, BuildContext context) {
  final responsive = ResponsiveUtils(context);

  showCupertinoModalPopup(
    context: context,
    builder: (_) => CupertinoActionSheet(
      title: Text("${category.title} ${context.translate(AppStrings.category)}",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: responsive.setTextSize(3.5))),
      message: Column(
        children: [
          responsive.setSizeBox(height: 2),
          CupertinoTextField(
            controller: context.read<CategoryCubit>().arTitleController,
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
            controller: context.read<CategoryCubit>().enTitleController,
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
          responsive.setSizeBox(height: 1),
        ],
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            context
                .read<CategoryCubit>()
                .fetchUpdateTitleCategories(category.sId);
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
