import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:flutter/cupertino.dart';

void showeDriverEditActionDialog(
    BuildContext context, DataAuthResponse authData, bool isActive) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => CupertinoActionSheet(
      title: Text(
        context.translate(AppStrings.actions),
        style: TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
      ),
      actions: [
        if (!isActive) ...[
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              context.read<DriverCubit>().fetchDriverActive(authData.sId!);
            },
            child: Text(
              context.translate(AppStrings.active),
              style:
                  TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
            ),
          ),
        ],
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            context
                .read<DriverCubit>()
                .fetchDeleteDriver(id: authData.sId!, isActive: isActive);
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
