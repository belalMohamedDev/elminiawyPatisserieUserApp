import 'package:elminiawy/core/utils/extensions.dart';
import 'package:elminiawy/feature/address/logic/storeAddressCubit/store_address_cuibt_cubit.dart';
import 'package:elminiawy/feature/address/logic/userAddressCubit/user_address_cubit.dart';
import 'package:elminiawy/feature/address/presentation/screen/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/application/di.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/images/asset_manger.dart';
import '../../../../core/utils/persistent_nav_bar_navigator.dart.dart';
import '../../logic/mapCubit/map_cubit.dart';
import '../refactor/user_address_body.dart';

class UserAddressView extends StatefulWidget {
  const UserAddressView({super.key});

  @override
  State<UserAddressView> createState() => _UserAddressViewState();
}

class _UserAddressViewState extends State<UserAddressView> {
  @override
  void initState() {
    super.initState();
    context.read<UserAddressCubit>().getUserAddress();
  }

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
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: InkWell(
                onTap: () {
                  NavBarNavigator.push(context,
                      screen: MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => instance<MapCubit>(),
                          ),
                          BlocProvider.value(
                            value: instance<StoreAddressCuibt>(),
                          ),
                        ],
                        child: const MapScreen(),
                      ),
                      withNavBar: false);
                },
                child: Image.asset(
                  ImageAsset.addLocation,
                  height: 22.h,
                )),

    
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
