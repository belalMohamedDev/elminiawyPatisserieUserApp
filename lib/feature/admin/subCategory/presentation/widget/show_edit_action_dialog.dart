import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:flutter/cupertino.dart';

void showEditSubCategoryActionDialog(
  BuildContext context,
  SubCategoryResponseData subCategory,
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
            showEditAndCreateSubCategoryDialog(
                context,
                subCategory,
                context.read<SubCategoriesCubit>(),
                context.read<CategoryCubit>());
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
            context.read<SubCategoriesCubit>().fetchUpdateSubCategories(
                id: subCategory.sId, active: !subCategory.active!);
          },
          child: Text(
            subCategory.active == true
                ? context.translate(AppStrings.deActive)
                : context.translate(AppStrings.active),
            style:
                TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            deleteSubCategoryItem(
                context, subCategory, context.read<SubCategoriesCubit>());
          },
          isDestructiveAction: true,
          child: Text(
            context.translate(AppStrings.delete),
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
