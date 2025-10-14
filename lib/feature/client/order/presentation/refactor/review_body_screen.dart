import '../../../../../core/common/shared/shared_imports.dart'; //

class ReviewPaymentBody extends StatefulWidget {
  const ReviewPaymentBody({super.key});

  @override
  State<ReviewPaymentBody> createState() => _ReviewPaymentBodyState();
}

class _ReviewPaymentBodyState extends State<ReviewPaymentBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final paymentCuibt = context.read<PaymentCubit>();

    final responsive = ResponsiveUtils(context);
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;
    final addressData = AppInitialRoute.role == "admin"
        ? null
        : context
            .read<UserAddressCubit>()
            .addressDataList[context.read<PaymentCubit>().selectedIndex];

    return Padding(
      padding: responsive.setPadding(top: 3, right: 6, left: 6, bottom: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppInitialRoute.role == "admin"
                ? const SizedBox()
                : const CheckOutProcessing(screenIndex: 3),
            responsive.setSizeBox(
              height: AppInitialRoute.role == "admin" ? 0 : 3,
            ),
            Text(
              context.translate(AppStrings.shippingAddress),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: responsive.setTextSize(4)),
            ),

            Padding(
              padding: responsive.setPadding(bottom: 1, top: 0.8),
              child: InkWell(
                onTap: () async {
                  if (AppInitialRoute.role == "admin") {
                    final selected = await showMenu<String>(
                      color: ColorManger.backgroundItem,
                      context: context,
                      position: RelativeRect.fromLTRB(
                          100,
                          responsive.setHeight(25.5),
                          responsive.setWidth(6.5),
                          100),
                      items: [
                        const PopupMenuItem(
                          value: "Store Pickup",
                          child: Text("Store Pickup"),
                        ),
                        const PopupMenuItem(
                          value: "By Phone",
                          child: Text("By Phone"),
                        ),
                      ],
                    );

                    if (selected != null &&
                        selected != paymentCuibt.selectedOption) {
                      paymentCuibt.changeOrderType(selected);
                    }
                  } else {
                    context.read<UserAddressCubit>().isPaymentAddress = true;

                    Navigator.of(context, rootNavigator: !false)
                        .popAndPushNamed(Routes.map);
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: responsive.setHeight(6),
                  decoration: BoxDecoration(
                    color: ColorManger.backgroundItem,
                    borderRadius:
                        BorderRadius.circular(responsive.setBorderRadius(2)),
                    border: Border.all(
                        color: ColorManger.brownLight,
                        width: responsive.setWidth(0.1)),
                  ),
                  child: Padding(
                    padding: responsive.setPadding(
                        left: isEnLocale ? 2 : 0, right: isEnLocale ? 0 : 2),
                    child: Row(
                      children: [
                        Icon(
                          IconlyBold.location,
                          color: ColorManger.brun,
                        ),
                        responsive.setSizeBox(width: 1.5),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 275.w),
                          child: Text(
                            AppInitialRoute.role == "admin"
                                ? paymentCuibt.selectedOption
                                : addressData!.region ?? "",
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: responsive.setTextSize(3.5)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// Animated Container for "By Phone"
            BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  child: paymentCuibt.isPhoneOrder
                      ? Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: ColorManger.backgroundItem,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: ColorManger.backgroundItem),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTextField(
                                controller: paymentCuibt.customerNameController,
                                label: "Customer Name",
                                icon: Icons.person,
                              ),
                              SizedBox(height: 10.h),
                              _buildTextField(
                                controller:
                                    paymentCuibt.customerPhoneController,
                                label: "Customer Phone",
                                icon: Icons.phone,
                                keyboardType: TextInputType.phone,
                              ),
                              SizedBox(height: 10.h),
                              _buildTextField(
                                controller:
                                    paymentCuibt.customerAddressTextController,
                                label: "Customer Address",
                                icon: Icons.location_on,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                );
              },
            ),

            responsive.setSizeBox(
              height: 1,
            ),

            AppInitialRoute.role == "admin"
                ? const SizedBox()
                : Text(
                    context.translate(AppStrings.payment),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: responsive.setTextSize(4)),
                  ),
            AppInitialRoute.role == "admin"
                ? const SizedBox()
                : Padding(
                    padding: responsive.setPadding(bottom: 1, top: 0.8),
                    child: InkWell(
                      onTap: () {
                        context.read<UserAddressCubit>().isPaymentAddress =
                            true;

                        Navigator.of(context, rootNavigator: !false)
                            .popAndPushNamed(Routes.map);
                      },
                      child: Container(
                        width: double.infinity,
                        height: responsive.setHeight(6),
                        decoration: BoxDecoration(
                          color: ColorManger.backgroundItem,
                          borderRadius: BorderRadius.circular(
                              responsive.setBorderRadius(2)),
                          border: Border.all(
                              color: ColorManger.brownLight,
                              width: responsive.setWidth(0.1)),
                        ),
                        child: Padding(
                          padding: responsive.setPadding(
                              left: isEnLocale ? 2 : 0,
                              right: isEnLocale ? 0 : 2),
                          child: Row(
                            children: [
                              Icon(
                                Icons.credit_card,
                                color: ColorManger.brun,
                              ),
                              responsive.setSizeBox(width: 1.5),
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 275.w),
                                child: Text(
                                  context
                                              .read<PaymentCubit>()
                                              .choosePaymentMethod ==
                                          'Cash'
                                      ? context
                                          .translate(AppStrings.cashOnDelivery)
                                      : context.translate(
                                          AppStrings.creditOrDebitCard),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontSize:
                                              responsive.setTextSize(3.5)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            // _paymentMethodContainer(context, responsive),
            responsive.setSizeBox(
              height: 0.5,
            ),
            _addNotes(context, responsive)
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: ColorManger.brown),
        labelText: label,
        labelStyle: TextStyle(color: ColorManger.brown),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.backgroundItem),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.backgroundItem, width: 1.2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Column _addNotes(BuildContext context, ResponsiveUtils responsive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.translate(AppStrings.addNotes),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: responsive.setTextSize(4)),
        ),
        responsive.setSizeBox(height: 1),
        TextFormField(
          controller: context.read<PaymentCubit>().notesController,
          keyboardType: TextInputType.text,
          minLines: 1,
          maxLines: 10,
          decoration: InputDecoration(
              hintText:
                  context.translate(AppStrings.typeAnyNoteRelatedToThisOrder),
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: responsive.setTextSize(3.5)),
              fillColor: ColorManger.backgroundItem,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManger.brownLight, width: 0.5),
                borderRadius: BorderRadius.all(Radius.elliptical(
                    responsive.setBorderRadius(2),
                    responsive.setBorderRadius(2))),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.backgroundItem,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(
                    responsive.setBorderRadius(2),
                    responsive.setBorderRadius(2))),
              )),
        ),
      ],
    );
  }
}
