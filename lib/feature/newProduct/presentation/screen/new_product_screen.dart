import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/application/cubit/app_logic_cubit.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../refactor/new_product_body.dart';

class NewProductView extends StatefulWidget {
  const NewProductView({super.key});

  @override
  State<NewProductView> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Products in Store",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();

            context.read<AppLogicCubit>().setHideNavigationBar(false);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
        child: const NewProductBody(),
      ),
    );
  }
}
