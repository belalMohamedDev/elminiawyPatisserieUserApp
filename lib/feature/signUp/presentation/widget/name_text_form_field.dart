import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/fonts/strings_manger.dart';
import '../../bloc/sign_up_bloc.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.firstName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      context
                          .read<SignUpBloc>()
                          .add(UserSignUFirstNameEvent(value));
                    },
                    textInputAction: TextInputAction.next,
                    autofillHints: const [
                      AutofillHints.name,
                    ],
                    keyboardType: TextInputType.text,
                    controller: context.read<SignUpBloc>().userSignUpFirstName,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          IconlyBroken.addUser,
                          size: 16.sp,
                        ),
                        hintText: AppStrings.firstNameExample,
                        errorText: state.whenOrNull(
                          userSignUpFirstName: (value) {
                            return value.isNotEmpty ? value : null;
                          },
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.lastName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextFormField(
                      onChanged: (value) {
                        context
                            .read<SignUpBloc>()
                            .add(UserSignUpLastNameEvent(value));
                      },
                      autofillHints: const [
                        AutofillHints.familyName,
                      ],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      controller: context.read<SignUpBloc>().userSignUpLastName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          IconlyBroken.addUser,
                          size: 16.sp,
                        ),
                        hintText: AppStrings.lastNameExample,
                        errorText: state.whenOrNull(
                          userSignUpLastName: (value) {
                            return value.isNotEmpty ? value : null;
                          },

                          // )
                        ),
                      ))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
