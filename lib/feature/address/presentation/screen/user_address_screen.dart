import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/images/asset_manger.dart';
import '../../logic/userAddressCubit/user_address_cubit.dart';
import '../refactor/user_address_body.dart';

class UserAddressView extends StatelessWidget {
  const UserAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Address",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          BlocBuilder<UserAddressCubit, UserAddressState>(
            builder: (context, state) {
              return context.read<UserAddressCubit>().addressDataList.isEmpty ||
                      state is GetAllAddressLoading
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: !false)
                                .pushNamed(Routes.map);
                          },
                          child: Image.asset(
                            ImageAsset.addLocation,
                            height: 22.h,
                          )),
                    );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 10.h),
        child: const UserAddressBody(),
      ),
    );
  }
}
