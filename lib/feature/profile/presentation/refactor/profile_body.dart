import 'package:elminiawy/feature/profile/cubit/log_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/images/asset_manger.dart';
import '../widget/profile_column_card.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.h,
          color: ColorManger.brun,
          child: BlocBuilder<LogOutCubit, LogOutState>(
            builder: (context, state) {
              return Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  context.read<LogOutCubit>().initialUserToken == 'Guest User'
                      ? Image.asset(
                          ImageAsset.guestIconGreen,
                          color: ColorManger.white,
                          height: 100.h,
                        )
                      : Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: Colors.white70),
                          child: Center(
                            child: Text(
                                context
                                    .read<LogOutCubit>()
                                    .initialUserToken[0]
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: ColorManger.brun,
                                        fontSize: 60.sp)),
                          ),
                        ),
                  SizedBox(
                    width: 20.w,
                  ),
                  context.read<LogOutCubit>().initialUserToken == 'Guest User'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Guest User",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: Colors.white70,
                                        fontSize: 12.sp)),
                            Text("Login to View all the features",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: Colors.white60,
                                        fontSize: 12.sp)),
                          ],
                        )
                      : Text(
                          "Welcome back! Let's achieve\n great things today!",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                  ),
                        ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        profileColumnCard(context),
      ],
    );
  }



}
