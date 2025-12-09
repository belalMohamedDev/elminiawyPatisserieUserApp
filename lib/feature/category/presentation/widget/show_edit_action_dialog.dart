import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:flutter/cupertino.dart';

void showEditCategoryActionDialog(
  BuildContext context,
  CategoryResponseData category,
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
            showEditPopup(category, context);
          },
          child: Text(
            context.translate(AppStrings.edit),
            style: TextStyle(
              fontFamily: FontConsistent.geLocalozedFontFamily(),
            ),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            Navigator.pop(context);

            await context.read<CategoryCubit>().pickImage();

            final image = context.read<CategoryCubit>().imageFile;

            if (image != null) {
              context.read<CategoryCubit>().fetchUpdateImageCategories(
                category.sId!,
                image,
              );
            }
          },
          child: Text(
            context.translate(AppStrings.editImage),
            style: TextStyle(
              fontFamily: FontConsistent.geLocalozedFontFamily(),
            ),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            context.read<CategoryCubit>().fetchUpdateActiveOrNotCategories(
              category.sId,
              !category.active!,
            );
          },
          child: Text(
            category.active == true
                ? context.translate(AppStrings.deActive)
                : context.translate(AppStrings.active),
            style: TextStyle(
              fontFamily: FontConsistent.geLocalozedFontFamily(),
            ),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            context.read<CategoryCubit>().fetchDeleteCategories(category.sId);
          },
          isDestructiveAction: true,
          child: Text(
            context.translate(AppStrings.delete),
            style: TextStyle(
              fontFamily: FontConsistent.geLocalozedFontFamily(),
            ),
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
