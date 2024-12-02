import 'package:elminiawy/core/common/shared/shared_imports.dart';

void deleteSubCategoryItem(BuildContext context, SubCategoryResponseData item,
    SubCategoriesCubit subCategoryCuibt) {
  final responsive = ResponsiveUtils(context);
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: ColorManger.white,
      content: Text(
        "${context.translate(AppStrings.areYouSureYouWantToDelete)} ${item.title}?",
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: responsive.setTextSize(5)),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            context.translate(AppStrings.cancel),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: responsive.setTextSize(4)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            subCategoryCuibt.fetchDeleteSubCategories(item.sId);
          },
          child: Text(context.translate(AppStrings.delete),
              style: TextStyle(
                  color: ColorManger.redError,
                  fontFamily: FontConsistent.geLocalozedFontFamily(),
                  fontSize: responsive.setTextSize(4))),
        ),
      ],
    ),
  );
}
