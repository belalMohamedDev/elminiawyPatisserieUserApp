import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/banner/presentation/widget/banners_shimmer_loading_body.dart';
import 'package:elminiawy/feature/admin/banner/presentation/widget/banners_success_data_body.dart';
import 'package:flutter/cupertino.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  @override
  void initState() {
    context.read<BannerCubit>().getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.translate(AppStrings.banners),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: responsive.setTextSize(4)),
        ),
      ),
      body: BlocBuilder<BannerCubit, BannerState>(
        builder: (context, state) {
          if (state is GetBannersLoading) {
            return const BannersShimmerLoadingBody();
          }
          return BannersSuccessDataBody(state: state);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManger.brun,
        onPressed: () {
          showCreateBannerDialog(context);
        },
        child: Icon(
          Icons.add,
          color: ColorManger.white,
        ),
      ),
    );
  }
}

void showCreateBannerDialog(
  BuildContext context,
) {
  final responsive = ResponsiveUtils(context);
  final bannerCuibt = context.read<BannerCubit>();
  showCupertinoModalPopup(
    context: context,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) {
        return CupertinoActionSheet(
          title: Text(
            context.translate(AppStrings.actions),
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
                    setState(() {
                      bannerCuibt.startDateController.text =
                          '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                    });
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
                    setState(() {
                      bannerCuibt.endDateController.text =
                          '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                    });
                  }
                },
              ),
            ],
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                bannerCuibt.pickImage(ImageSource.gallery);
              },
              child: Text(
                context.translate(AppStrings.addImage),
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
