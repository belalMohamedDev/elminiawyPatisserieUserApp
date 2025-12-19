import 'package:elminiawy/feature/admin/coupons/data/model/coupons_response.dart';
import 'package:elminiawy/feature/admin/coupons/logic/coupons_cubit.dart';
import 'package:elminiawy/feature/admin/coupons/presentation/widgets/open_coupon_sheet.dart';

import '../../../../../core/common/shared/shared_imports.dart';

class CouponCardWidget extends StatelessWidget {
  const CouponCardWidget({super.key, required this.coupon});

  final CouponsData coupon;

  bool get isExpired =>
      coupon.expire != null &&
      DateTime.parse(coupon.expire!).isBefore(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Container(
      padding: responsive.setPadding(left: 3, right: 3, top: 3, bottom: 3),
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== Title + Discount =====
          Row(
            children: [
              Expanded(
                child: Text(
                  coupon.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isExpired
                      ? Colors.red.withValues(alpha: 0.15)
                      : Colors.green.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${coupon.discount}%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isExpired ? Colors.red : Colors.green,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: responsive.setHeight(1)),

          /// ===== Expire Date =====
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: responsive.setHeight(2),
                color: isExpired ? Colors.red : Colors.grey,
              ),
              SizedBox(width: responsive.setWidth(2)),
              Text(
                isExpired
                    ? context.translate(AppStrings.expired)
                    : '${context.translate(AppStrings.expireAt)}: ${coupon.expire != null ? DateTime.parse(coupon.expire!).toString().split(' ')[0] : ''}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isExpired ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),

          SizedBox(height: responsive.setHeight(1.5)),

          /// ===== Actions =====
          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  openCouponSheet(context, coupon: coupon);
                },
                icon: const Icon(Icons.edit),
                label: Text(context.translate(AppStrings.edit)),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => _confirmDelete(context),
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: ColorManger.brun,
        title: Text(context.translate(AppStrings.deleteCoupon)),
        content: Text(context.translate(AppStrings.confirmDelete)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              context.translate(AppStrings.cancel),
              style: Theme.of(context).textTheme.headlineSmall!,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                ColorManger.backgroundItem,
              ),
            ),
            onPressed: () {
               context.read<CouponsCubit>().deleteCoupon(coupon.sId!);
              Navigator.pop(context);
            },
            child: Text(
              context.translate(AppStrings.delete),
              style: Theme.of(context).textTheme.titleLarge!,
            ),
          ),
        ],
      ),
    );
  }
}
