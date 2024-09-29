

import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class ApplyCouponCode extends StatelessWidget {
  const ApplyCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        state.whenOrNull(
          deleteCartItemError: (statesCode, errorMessage) =>
              ShowToast.showToastErrorTop(
                  errorMessage: errorMessage, context: context),
          getCartItemSuccess: (data) => ShowToast.showToastSuccessTop(
              message: data!.message!, context: context),
        );
      },
      builder: (context, state) {
        return Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: ColorManger.brownLight,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Center(
              child: SizedBox(
                height: 40.h,
                child: TextFormField(
                  controller: context.read<CartCubit>().applyCouponController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Transform.rotate(
                        angle: 1.58,
                        child: Icon(
                          IconlyBroken.ticket,
                          color: ColorManger.brunLight,
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () => context.read<CartCubit>().applyCoupon(),
                        child: Container(
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: ColorManger.brun,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: state is ApplyCouponLoading
                              ? Center(
                                  child: SizedBox(
                                    height: 20.h,
                                    width: 20.w,
                                    child: CircularProgressIndicator(
                                      color: ColorManger.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'Apply',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontFamily:
                                                FontConsistent.fontFamilyAcme,
                                            color: ColorManger.white,
                                            fontSize: 12.sp),
                                  ),
                                ),
                        ),
                      ),
                      hintText: 'Enter Voucher code',
                      hintStyle: TextStyle(color: ColorManger.brunLight),
                      fillColor: ColorManger.backgroundItem,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.backgroundItem,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.backgroundItem,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                      )),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
