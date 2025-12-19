import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/coupons/logic/coupons_cubit.dart';
import 'package:elminiawy/feature/admin/coupons/presentation/widgets/coupon_card.dart';
import 'package:elminiawy/feature/admin/coupons/presentation/widgets/open_coupon_sheet.dart';

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CouponsCubit>().fetchGetAllCoupons();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<CouponsCubit, CouponsState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text(context.translate(AppStrings.coupons)),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => openCouponSheet(context),
                  ),
                ],
              ),

              body: BlocBuilder<CouponsCubit, CouponsState>(
                builder: (context, state) {
                  if (state is GetAllCouponsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is GetAllCouponsError) {
                    return Center(
                      child: Text(
                        state.apiErrorModel.message!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  }

                  final coupons = context.read<CouponsCubit>().coupons;

                  if (coupons.isEmpty) {
                    return Center(
                      child: Text(
                        context.translate(AppStrings.noCouponsFound),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: responsive.setPadding(left: 4, right: 4, top: 2),
                    itemCount: coupons.length,
                    separatorBuilder: (_, _) =>
                        SizedBox(height: responsive.setHeight(1.5)),
                    itemBuilder: (context, index) {
                      return CouponCardWidget(coupon: coupons[index]);
                    },
                  );
                },
              ),
            ),
            LoadingOverlay(isLoading: state is ActionLoading),
          ],
        );
      },
    );
  }
}
