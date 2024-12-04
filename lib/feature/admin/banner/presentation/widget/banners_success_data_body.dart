import 'package:elminiawy/core/common/shared/shared_imports.dart';

class BannersSuccessDataBody extends StatelessWidget {
  const BannersSuccessDataBody({
    super.key,
    required this.state,
  });

  final BannerState state;

  @override
  Widget build(BuildContext context) {
    final banners = context.read<BannerCubit>().banners;
    final responsive = ResponsiveUtils(context);
    return ListView.builder(
      itemCount: banners.length,
      itemBuilder: (context, index) {
        final banner = banners[index];
        return Padding(
          padding: responsive.setPadding(bottom: 1, left: 2, right: 2),
          child: Container(
            decoration: BoxDecoration(
                color: ColorManger.backgroundItem,
                borderRadius:
                    BorderRadius.circular(responsive.setBorderRadius(3))),
            child: ListTile(
              contentPadding: responsive.setPadding(
                left: 3.5,
                right: 3.5,
              ),
              leading: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(responsive.setBorderRadius(1.5)),
                    child: CachedNetworkImage(
                      imageUrl: banner.image!,
                      width: responsive.setWidth(18),
                      placeholder: (context, url) => LoadingShimmer(
                        width: responsive.setWidth(18),
                        borderRadius: responsive.setBorderRadius(2),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  state is UpdateImageBannersLoading &&
                          (state as UpdateImageBannersLoading).id == banner.sId
                      ? Positioned(
                          left: responsive.setWidth(4.5),
                          top: responsive.setHeight(1),
                          child: responsive.setSizeBox(
                            height: 3,
                            width: 7,
                            child: CircularProgressIndicator(
                              color: ColorManger.brun,
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              title: Text(
                banner.startDate!.getFormattedDateAndHourse(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: responsive.setTextSize(3.2)),
              ),
              subtitle: Text(
                banner.endDate!.getFormattedDateAndHourse(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: responsive.setTextSize(3.2)),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTap: () {
                        showEditBannerDialog(
                            context, banner);
                      },
                      child: Icon(Icons.edit, color: ColorManger.brun)),
                  responsive.setSizeBox(width: 3),
                  state is DeleteBannersLoading &&
                          (state as DeleteBannersLoading).id == banner.sId
                      ? responsive.setSizeBox(
                          width: 5,
                          height: 3,
                          child: CircularProgressIndicator(
                            color: ColorManger.redError,
                            strokeWidth: responsive.setWidth(0.8),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            context
                                .read<BannerCubit>()
                                .deleteBanner(banner.sId!);
                          },
                          child:
                              Icon(Icons.delete, color: ColorManger.redError)),
                  responsive.setSizeBox(width: 6.5),
                  Icon(
                    banner.endDate != null &&
                            DateTime.parse(banner.endDate!)
                                .isAfter(DateTime.now())
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: banner.endDate != null &&
                            DateTime.parse(banner.endDate!)
                                .isAfter(DateTime.now())
                        ? Colors.green
                        : Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
