import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:flutter/cupertino.dart';

void showEditBannerDialog(BuildContext context, DataBannerResponse banner) {
  final responsive = ResponsiveUtils(context);
  final bannerCuibt = context.read<BannerCubit>();
  showCupertinoModalPopup(
    context: context,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) {
        return CupertinoActionSheet(
          title: Text(
            context.translate(AppStrings.banners),
            style:
                TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                   showCreateAndEditImageBannerDialog(context,banner, bannerCuibt);
              },
              child: Text(
                context.translate(AppStrings.edit),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: responsive.setTextSize(4)),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                bannerCuibt.pickImage(ImageSource.gallery, banner.sId);
              },
              child: Text(
                context.translate(AppStrings.editImage),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: responsive.setTextSize(4)),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              context.translate(AppStrings.cancel),
              style:
                  TextStyle(fontFamily: FontConsistent.geLocalozedFontFamily()),
            ),
          ),
        );
      },
    ),
  );
}
