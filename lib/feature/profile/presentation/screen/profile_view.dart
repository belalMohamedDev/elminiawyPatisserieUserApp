import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../order/cubit/payment_cubit.dart';
import '../../cubit/log_out_cubit.dart';
import '../refactor/profile_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorManger.brun,
        statusBarIconBrightness: Brightness.light,
      ),
    );
     context.read<LogOutCubit>().getUserName().then((value) {
      if(context.read<LogOutCubit>().initialUserName !='Guest User'){
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await Future.wait([
              context.read<PaymentCubit>().getCompleteOrdersSummit(),
              context.read<PaymentCubit>().getOrdersPendingSummit(),
            ]);
          });
      }
       
     },);
 
   
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileBody(),
    );
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorManger.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    super.dispose();
  }
}
