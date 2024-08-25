import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/app_storage_key.dart';
import '../../../../core/services/shared_pref_helper.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';

class AccountInfomation extends StatelessWidget {
  const AccountInfomation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("       My Account Information",
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
            padding: EdgeInsets.only(right: 18.w),
            child: Text("Edit",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.primary,
                    fontSize: 15.sp)),
          )
        ],
      ),
      body: const AccountInfomationBody(),
    );
  }
}

class AccountInfomationBody extends StatefulWidget {
  const AccountInfomationBody({super.key});

  @override
  State<AccountInfomationBody> createState() => _AccountInfomationBodyState();
}

class _AccountInfomationBodyState extends State<AccountInfomationBody> {
  String userEmail = '';
  String userName = '';
  String userPhone = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    final email = await SharedPrefHelper.getSecuredString(PrefKeys.userEmail);
    final name = await SharedPrefHelper.getSecuredString(PrefKeys.userName);
    final phone = await SharedPrefHelper.getSecuredString(PrefKeys.userPhone);

    setState(() {
      userEmail = email;
      userName = name;
      userPhone = phone;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 50.h),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(
                  height: 50.h,
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: userEmail,
                      prefixIcon: Icon(IconlyBroken.message,
                          size: 18.sp, color: ColorManger.brunLight),
                      hintStyle: TextStyle(color: ColorManger.brunLight),
                      fillColor: ColorManger.backgroundItem,
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.backgroundItem,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 50.h,
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      // hintText: 'name',
                      hintText: userName,

                      prefixIcon: Icon(IconlyBroken.profile,
                          size: 18.sp, color: ColorManger.brunLight),
                      hintStyle: TextStyle(color: ColorManger.brunLight),
                      fillColor: ColorManger.backgroundItem,
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.backgroundItem,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 50.h,
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      // hintText: 'phone',
                      hintText: userPhone,

                      prefixIcon: Icon(IconlyBroken.call,
                          size: 18.sp, color: ColorManger.brunLight),
                      hintStyle: TextStyle(color: ColorManger.brunLight),
                      fillColor: ColorManger.backgroundItem,
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.backgroundItem,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorManger.redError.withAlpha(200)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Delete account",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 16.sp,
                          color: ColorManger.backgroundItem,
                          fontWeight: FontWeightManger.semiBold),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
