import 'package:elminiawy/core/common/shared/shared_imports.dart';

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
          final banners = context.read<BannerCubit>().banners;
          return ListView.builder(
            itemCount: banners.length,
            itemBuilder: (context, index) {
              final banner = banners[index];
              return ListTile(
                leading: CachedNetworkImage(
                  imageUrl: banner.image!,
                  width: responsive.setWidth(18),
                  placeholder: (context, url) => LoadingShimmer(
                    width: responsive.setWidth(18),
                    borderRadius: responsive.setBorderRadius(2),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                title: Text(
                  banner.title!,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(3.5)),
                ),
                subtitle: Text(
                  '${context.translate(AppStrings.discount)} ${banner.discount}%',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(3.5)),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit, color: ColorManger.brun),
                    responsive.setSizeBox(width: 3),
                    state is DeleteBannersLoading && (state).id == banner.sId
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
                            child: Icon(Icons.delete,
                                color: ColorManger.redError)),
                    responsive.setSizeBox(width: 3),
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
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManger.brun,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: ColorManger.white,
        ),
      ),
    );
  }
}
