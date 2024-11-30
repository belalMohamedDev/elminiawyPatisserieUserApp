import 'package:elminiawy/core/common/shared/shared_imports.dart';

void showEditPopup(CategoryResponseData category, BuildContext context) {
  final responsive = ResponsiveUtils(context);

  showCupertinoModalPopup(
    context: context,
    builder: (_) => CupertinoActionSheet(
      title: Text("Edit ${category.title} Category"),
      message: Column(
        children: [
          responsive.setSizeBox(height: 2),
          CupertinoTextField(
            controller: context.read<CategoryCubit>().arTitleController,
            placeholder: "Enter Arabic Title",
            style: const TextStyle(fontSize: 16, color: CupertinoColors.black),
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
            placeholder: "Enter English Title",
            style: const TextStyle(fontSize: 16, color: CupertinoColors.black),
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
          child: const Text("Save"),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Cancel"),
      ),
    ),
  );
}
