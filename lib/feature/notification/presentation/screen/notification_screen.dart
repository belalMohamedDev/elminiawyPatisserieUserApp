import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/app_storage_key.dart';
import '../../../../core/services/shared_pref_helper.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../logic/cubit/user_notification_cubit.dart';
import '../refactor/notification_screen_body.dart';

class UserNotificationScreen extends StatefulWidget {
  const UserNotificationScreen({super.key});

  @override
  State<UserNotificationScreen> createState() => _UserNotificationScreenState();
}

class _UserNotificationScreenState extends State<UserNotificationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String initialUserName =
          await SharedPrefHelper.getSecuredString(PrefKeys.userName);
      if (initialUserName.isNotEmpty) {
        await Future.wait([
          context.read<UserNotificationCubit>().updateAllNotificationsToSeen()
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Notification",
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
        ),
        body: const UserNotificationBody());
  }
}
