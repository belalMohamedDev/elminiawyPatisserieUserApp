import 'package:elminiawy/core/common/shared/shared_imports.dart';

void showAddCategoryDialog(BuildContext context) {
  final responsive = ResponsiveUtils(context);
  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(context.translate(AppStrings.addNewCategory),
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: responsive.setTextSize(3.5))),
      content: Column(
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
            context.read<CategoryCubit>().pickImage(ImageSource.gallery, null);
            Navigator.pop(context);
          },
          child: Text(
              context.translate(
                AppStrings.addImage,
              ),
              style: TextStyle(
                  fontFamily: FontConsistent.geLocalozedFontFamily())),
        ),
      ],
    ),
  );
}
