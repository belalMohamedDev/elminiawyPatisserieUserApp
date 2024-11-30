import 'package:elminiawy/core/common/shared/shared_imports.dart';

void showAddCategoryDialog(BuildContext context) {
  final responsive = ResponsiveUtils(context);
  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: const Text('Add New Category'),
      content: Column(
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
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            context.read<CategoryCubit>().pickImage(ImageSource.gallery, null);
            Navigator.pop(context);
          },
          child: const Text('Add Image'),
        ),
      ],
    ),
  );
}
