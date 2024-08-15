import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/common/loading/loading_shimmer.dart';
import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../logic/userAddressCubit/user_address_cubit.dart';

class UserAddressBody extends StatelessWidget {
  const UserAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAddressCubit, UserAddressState>(
      listener: (context, state) {
        state.whenOrNull(
          getAllAddressError: (statesCode, errorMessage) =>
              ShowToast.showToastErrorTop(
                  errorMessage: errorMessage, context: context),
          removeAddressError: (statesCode, errorMessage) =>
              ShowToast.showToastErrorTop(
                  errorMessage: errorMessage, context: context),
          removeAddressSuccess: (data) => ShowToast.showToastSuccessTop(
              message: data.message!, context: context),
        );
      },
      builder: (context, state) {
        if (state is GetAllAddressError || state is GetAllAddressLoading) {
          return _userAddressErrorAndLoadingState();
        }

        return _userAddressSuccessState(context);
      },
    );
  }

  ListView _userAddressSuccessState(BuildContext context) {
    final userAddress = context.read<UserAddressCubit>();
    return ListView.builder(
      addAutomaticKeepAlives: true,
      itemCount: userAddress.addressDataList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 70.h,
              child: Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) {
                          userAddress.deleteUserAddress(
                              userAddress.addressDataList[index].sId!);
                        },
                        backgroundColor: ColorManger.redError,
                        foregroundColor: ColorManger.white,
                        icon: IconlyBold.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: ColorManger.backgroundItem,
                        foregroundColor: ColorManger.brown,
                        icon: IconlyBold.edit,
                        label: 'Edite',
                      ),
                    ],
                  ),

                  // The child of the Slidable is what the user sees when the
                  // component is not dragged.
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Icon(
                          IconlyBold.location,
                          color: ColorManger.brown,
                        ),
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userAddress.addressDataList[index].buildingName!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: ColorManger.brun,
                                    fontSize: 16.sp),
                          ),
                          Text(
                            userAddress.addressDataList[index].phone!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: ColorManger.grey,
                                    fontSize: 11.sp),
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            userAddress.addressDataList[index].region!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: ColorManger.grey,
                                    fontSize: 11.sp),
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        );
      },
    );
  }

  ListView _userAddressErrorAndLoadingState() {
    return ListView.builder(
      itemCount: 6,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Column(
            children: [
              LoadingShimmer(
                height: 70.h,
                width: double.infinity,
                borderRadius: 12.r,
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        );
      },
    );
  }
}
