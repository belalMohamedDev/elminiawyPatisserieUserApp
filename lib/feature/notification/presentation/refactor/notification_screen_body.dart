import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:elminiawy/feature/notification/data/model/user_notification_resp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/common/statsScreen/loading_shimmer.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../logic/cubit/user_notification_cubit.dart';
import '../screen/notifcation_empty_screen.dart';

class UserNotificationBody extends StatelessWidget {
  const UserNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserNotificationCubit, UserNotificationState>(
      builder: (context, state) {
        if (state is UserNotificationLoading ||
            state is UserNotificationError) {
          return _userNotificationErrorAndLoadingState();
        }
        if (context.read<UserNotificationCubit>().dataList.isEmpty) {
          return const EmptyNotificationsScreen();
        }
        final userNotification = context.read<UserNotificationCubit>().dataList;

        return Stack(
          children: [
            _userNotificationLoadedState(userNotification),
            state is DeleteUserNotificationLoading
                ? Center(
                    child: Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          color: ColorManger.brun,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.w,
                          color: ColorManger.white,
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        );
      },
    );
  }

  Padding _userNotificationLoadedState(
      List<UserNotificationData> userNotification) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: ListView.builder(
        addAutomaticKeepAlives: true,
        itemCount: userNotification.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 50.h,
                child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) {
                            context
                                .read<UserNotificationCubit>()
                                .deleteUserNotification(
                                    userNotification[index].sId!);
                          },
                          backgroundColor: ColorManger.redError,
                          foregroundColor: ColorManger.white,
                          icon: IconlyBold.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: ColorManger.brownLight,
                                borderRadius: BorderRadius.circular(100.r)),
                            child: Center(
                              child: Image.asset(
                                ImageAsset.orderDelivered,
                                height: 29.h,
                              ),
                            )),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userNotification[index].notificationId == null
                                  ? ""
                                  : userNotification[index]
                                      .notificationId!
                                      .title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontFamily: FontConsistent.fontFamilyAcme,
                                      color: ColorManger.brun,
                                      fontSize: 16.sp),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.w),
                              child: Text(
                                userNotification[index].notificationId == null
                                    ? ""
                                    : userNotification[index]
                                        .notificationId!
                                        .description!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: ColorManger.grey,
                                        fontSize: 11.sp),
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
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
      ),
    );
  }

  Padding _userNotificationErrorAndLoadingState() {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        top: 20.h,
      ),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: 30.w,
              bottom: 15.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: ColorManger.brownLight,
                        borderRadius: BorderRadius.circular(100.r)),
                    child: Center(
                      child: Image.asset(
                        ImageAsset.orderDelivered,
                        height: 29.h,
                      ),
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoadingShimmer(
                        height: 5.h,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      LoadingShimmer(
                        height: 5.h,
                        width: 180.w,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      LoadingShimmer(
                        height: 5.h,
                        width: 80.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
