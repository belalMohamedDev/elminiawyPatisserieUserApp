import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/product/logic/cubit/adminProduct/admin_product_cubit.dart';
import 'package:flutter/cupertino.dart';

void showEditProductActionDialog(
  BuildContext context,
  DataProductResponse product,
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
            showProductEditPopup(
              product,
              context,
            );
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
            context.read<AdminProductCubit>().pickImage(
                  ImageSource.gallery,
                  product.sId,
                );
          },
          child: Text(
            context.translate(AppStrings.editImage),
            style:
                TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
          ),
          // const Text('Edit Image'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            context.read<AdminProductCubit>().fetchUpdateProduct(
                  id: product.sId!,
                  active: !product.active!,
                );
          },
          child: Text(
            product.active == true
                ? context.translate(AppStrings.deActive)
                : context.translate(AppStrings.active),
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
