import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:flutter/cupertino.dart';

void showCreateAndEditImageBannerDialog(
    BuildContext context, DataBannerResponse? banner, BannerCubit bannerCuibt) {
  final responsive = ResponsiveUtils(context);

  if (banner != null) {
    bannerCuibt.endDateController.text = banner.endDate!.getFormattedDate();
    bannerCuibt.endDateText = banner.endDate!;
    bannerCuibt.startDateController.text = banner.startDate!.getFormattedDate();
    bannerCuibt.startDateText = banner.startDate!;
  }
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
          message: Column(
            children: [
              const SizedBox(height: 10),
              CupertinoTextField(
                suffix: Padding(
                  padding: responsive.setPadding(right: 4),
                  child: Icon(
                    Icons.edit,
                    color: Colors.grey,
                    size: responsive.setIconSize(5.5),
                  ),
                ),
                prefix: Padding(
                  padding: responsive.setPadding(left: 3),
                  child: Icon(
                    Icons.date_range_outlined,
                    color: Colors.grey,
                    size: responsive.setIconSize(5.5),
                  ),
                ),
                padding: responsive.setPadding(top: 1.5, bottom: 1, left: 1.5),
                decoration: BoxDecoration(
                  color: ColorManger.backgroundItem.withAlpha(180),
                  borderRadius: BorderRadius.circular(8),
                ),
                controller: bannerCuibt.startDateController,
                placeholder: context.translate(AppStrings.endDate),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: responsive.setTextSize(4)),
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );

                  if (pickedDate != null) {
                    bannerCuibt.setStartDate(pickedDate);
                  }
                },
              ),
              const SizedBox(height: 10),
              CupertinoTextField(
                suffix: Padding(
                  padding: responsive.setPadding(right: 4),
                  child: Icon(
                    Icons.edit,
                    color: Colors.grey,
                    size: responsive.setIconSize(5.5),
                  ),
                ),
                prefix: Padding(
                  padding: responsive.setPadding(left: 3),
                  child: Icon(
                    Icons.date_range_outlined,
                    color: Colors.grey,
                    size: responsive.setIconSize(5.5),
                  ),
                ),
                padding: responsive.setPadding(top: 1.5, bottom: 1, left: 1.5),
                decoration: BoxDecoration(
                  color: ColorManger.backgroundItem.withAlpha(180),
                  borderRadius: BorderRadius.circular(8),
                ),
                controller: bannerCuibt.endDateController,
                placeholder: context.translate(AppStrings.startDate),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: responsive.setTextSize(4)),
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );

                  if (pickedDate != null) {
                    bannerCuibt.setEndDate(pickedDate);
                  }
                },
              ),
            ],
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: banner != null
                  ? () {
                      Navigator.pop(context);
                      bannerCuibt.updateBannersDate(banner.sId!);
                    }
                  : () {
                      Navigator.pop(context);
                      bannerCuibt.pickImage(ImageSource.gallery, null);
                    },
              child: Text(
                context.translate(
                    banner == null ? AppStrings.addImage : AppStrings.save),
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
