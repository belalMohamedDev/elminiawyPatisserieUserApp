

import '../../../../../core/common/shared/shared_imports.dart'; //

class AgreeWithTermsCondition extends StatelessWidget {
  const AgreeWithTermsCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: context.read<SignUpBloc>().agreeWithTerms,
              onChanged: (bool? value) {
                context
                    .read<SignUpBloc>()
                    .add(UserSignUpAgreeWithEvent(value!));
              },
              activeColor: ColorManger.brun,
              //MaterialStateBorderSide
              side: WidgetStateBorderSide.resolveWith(
                (states) => BorderSide(
                  width: 1.2.sp,
                  color: ColorManger.brun,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            Text.rich(
                TextSpan(
                    text: AppStrings.agreeWith,
                    style: const TextStyle(fontSize: 15),
                    children: [
                      WidgetSpan(
                          child: SizedBox(
                        width: 8.w,
                      )),
                      TextSpan(
                          text: AppStrings.termsCondition,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontSize: 15,
                                  ))
                    ]),
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        );
      },
    );
  }
}
