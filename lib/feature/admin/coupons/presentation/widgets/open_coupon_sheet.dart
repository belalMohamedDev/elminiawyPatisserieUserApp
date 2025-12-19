import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/coupons/data/model/coupons_response.dart';
import 'package:elminiawy/feature/admin/coupons/logic/coupons_cubit.dart';

void openCouponSheet(BuildContext parentContext, {CouponsData? coupon}) {
  final titleCtrl = TextEditingController(text: coupon?.title ?? '');
  final discountCtrl = TextEditingController(
    text: coupon?.discount?.toString() ?? '',
  );

  DateTime? expireDate = coupon?.expire != null
      ? DateTime.parse(coupon!.expire!)
      : null;

  showModalBottomSheet(
    context: parentContext,
    isScrollControlled: true,
    backgroundColor: ColorManger.backgroundItem,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ===== Title =====
                Center(
                  child: Text(
                    coupon == null
                        ? context.translate(AppStrings.addCoupon)
                        : context.translate(AppStrings.editCoupon),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                const SizedBox(height: 20),

                /// ===== Coupon Name =====
                TextField(
                  controller: titleCtrl,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: context.translate(AppStrings.title),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// ===== Discount =====
                TextField(
                  controller: discountCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: context.translate(AppStrings.discount),
                    suffixText: '%',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// ===== Expire Date =====
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    expireDate == null
                        ? context.translate(AppStrings.selectExpireDate)
                        : expireDate!.toCouponDate(),
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final now = DateTime.now();

                    final initialDate =
                        expireDate != null && expireDate!.isAfter(now)
                        ? expireDate!
                        : now;

                    final picked = await showDatePicker(
                      context: context,
                      firstDate: now,
                      lastDate: DateTime(2035),
                      initialDate: initialDate,
                    );

                    if (picked != null) {
                      setModalState(() {
                        expireDate = picked;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),

                /// ===== Confirm Button =====
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManger.brun,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (titleCtrl.text.isEmpty ||
                          discountCtrl.text.isEmpty ||
                          expireDate == null) {
                        return;
                      }

                      final formattedExpire = expireDate!.toCouponDate();

                      if (coupon == null) {
                        parentContext.read<CouponsCubit>().addCoupon(
                          title: titleCtrl.text,
                          discount: discountCtrl.text,
                          expire: formattedExpire,
                        );
                      } else {
                        parentContext.read<CouponsCubit>().updateCoupon(
                          id: coupon.sId!,
                          title: titleCtrl.text,
                          discount: discountCtrl.text,
                          expire: formattedExpire,
                        );
                      }

                      Navigator.pop(context);
                    },
                    child: Text(
                      context.translate(AppStrings.confirm),
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.copyWith(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      );
    },
  );
}
