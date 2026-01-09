import 'package:elminiawy/core/common/shared/shared_imports.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    final responsive = ResponsiveUtils(context);

    return Padding(
      padding: responsive.setPadding(top: 3, right: 6, left: 6, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CheckOutProcessing(screenIndex: 2),
          responsive.setSizeBox(height: 5),
          Text(
            context.translate(AppStrings.chooseYourPaymentMethod),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: responsive.setTextSize(4),
            ),
          ),
          responsive.setSizeBox(height: 2),
          _choosePaymentMethod(context, responsive),
          responsive.setSizeBox(height: 3),
          Text(
            context.translate(AppStrings.promoCode),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: responsive.setTextSize(4),
            ),
          ),
          responsive.setSizeBox(height: 2),
          const ApplyCouponCode(),
          const Spacer(),
          CustomButton(
            onPressed: () {
              context.pushNamed(Routes.shippingReviewScreen);
            },
            widget: Text(
              context.translate(AppStrings.saveAndContinue),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: responsive.setTextSize(
                  3.8,
                ), // Adjusted font size for responsiveness
              ),
            ),
          ),
        ],
      ),
    );
  }

  BlocBuilder _choosePaymentMethod(
    BuildContext context,
    ResponsiveUtils responsive,
  ) {
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        final paymentCubit = context.read<PaymentCubit>();

        return RadioGroup<String>(
          groupValue: paymentCubit.choosePaymentMethod,
          onChanged: (value) {
            paymentCubit.changePaymentMethod(value!);
          },
          child: Column(
            children: [
              _PaymentOptionTile(
                responsive: responsive,
                isEnLocale: isEnLocale,
                isSelected: paymentCubit.choosePaymentMethod == 'Cash',
                icon: Icons.handshake_rounded,
                title: context.translate(AppStrings.cashOnDelivery),
                value: 'Cash',
                onTap: () => paymentCubit.changePaymentMethod('Cash'),
              ),

              responsive.setSizeBox(height: 1.2),

              _PaymentOptionTile(
                responsive: responsive,
                isEnLocale: isEnLocale,
                isSelected: paymentCubit.choosePaymentMethod == 'card',
                icon: Icons.credit_card,
                title: context.translate(AppStrings.creditOrDebitCard),
                value: 'card',
                onTap: () => paymentCubit.changePaymentMethod('card'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PaymentOptionTile extends StatelessWidget {
  final ResponsiveUtils responsive;
  final bool isEnLocale;
  final bool isSelected;
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _PaymentOptionTile({
    required this.responsive,
    required this.isEnLocale,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(responsive.setBorderRadius(2)),
      child: Container(
        width: double.infinity,
        height: responsive.setHeight(6),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManger.brownLight
              : ColorManger.backgroundItem,
          borderRadius: BorderRadius.circular(responsive.setBorderRadius(2)),
          border: Border.all(
            color: isSelected
                ? ColorManger.brownLight
                : ColorManger.backgroundItem,
            width: responsive.setWidth(0.1),
          ),
        ),
        padding: responsive.setPadding(
          left: isEnLocale ? 2 : 0,
          right: isEnLocale ? 0 : 2,
        ),
        child: Row(
          children: [
            Icon(icon, color: ColorManger.brun),

            responsive.setSizeBox(width: 3),

            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: responsive.setTextSize(4),
                ),
              ),
            ),

            Radio<String>(value: value, activeColor: ColorManger.brun),
          ],
        ),
      ),
    );
  }
}
