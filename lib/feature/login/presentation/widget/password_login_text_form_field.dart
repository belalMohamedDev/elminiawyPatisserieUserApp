import 'package:elminiawy/core/style/fonts/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordLoginTextFormField extends StatelessWidget {
  const PasswordLoginTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.password,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: 8.h,
        ),

        TextFormField(
          onChanged: (value) {
            //  context.read<LoginBloc>().add(UserLoginPassword(value));
          },
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          //    controller: context.read<LoginBloc>().userLoginPassword,
          //    obscureText: context.read<LoginBloc>().showPass,
          decoration: InputDecoration(
            prefixIcon: Icon(
              IconlyBroken.lock,
              size: 18.sp,
            ),
            suffixIcon: IconButton(
                onPressed: () {},
                // context
                //     .read<LoginBloc>()
                //     .add(const UserShowLoginPassword()),
                icon:
                    //context.read<LoginBloc>().showPass
                    //?
                    Icon(
                  IconlyBroken.show,
                  size: 25.sp,
                )
                // : Icon(
                //     IconlyBroken.hide,
                //     size: 25.sp,
                //   ),
                ),
            hintText: AppStrings.enterYourPassword,
            // errorText: state.whenOrNull(
            //   userLoginPassword: (value) {
            //     return value.isNotEmpty ? value : null;
            //   },
            // )
          ),
        )

        ////////////////////////

        // BlocBuilder<LoginBloc, LoginState>(
        //   builder: (context, state) {
        //     return TextFormField(
        //       onChanged: (value) {

        //         context.read<LoginBloc>().add(UserLoginPassword(value));

        //       },
        //       textInputAction: TextInputAction.next,
        //       keyboardType: TextInputType.visiblePassword,
        //       controller: context.read<LoginBloc>().userLoginPassword,
        //       obscureText: context.read<LoginBloc>().showPass,
        //       decoration: InputDecoration(
        //           prefixIcon: Icon(
        //             IconlyBroken.lock,
        //             size: 18.sp,
        //           ),
        //           suffixIcon: IconButton(
        //             onPressed: () => context
        //                 .read<LoginBloc>()
        //                 .add(const UserShowLoginPassword()),
        //             icon: context.read<LoginBloc>().showPass
        //                 ? Icon(
        //                     IconlyBroken.show,
        //                     size: 25.sp,
        //                   )
        //                 : Icon(
        //                     IconlyBroken.hide,
        //                     size: 25.sp,
        //                   ),
        //           ),
        //           hintText: AppStrings.enterYourPassword,
        //           errorText: state.whenOrNull(
        //             userLoginPassword: (value) {
        //               return value.isNotEmpty ? value : null;
        //             },
        //           )),
        //     );
        //   },
        // ),
      ],
    );
  }
}
