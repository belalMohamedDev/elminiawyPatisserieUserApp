import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/banner/presentation/widget/banners_shimmer_loading_body.dart';
import 'package:elminiawy/feature/admin/banner/presentation/widget/banners_success_data_body.dart';

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
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: ColorManger.white,
        ),
      ),
    );
  }
}



