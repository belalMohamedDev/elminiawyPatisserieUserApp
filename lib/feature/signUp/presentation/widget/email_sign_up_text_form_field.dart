import '../../../../../core/common/shared/shared_imports.dart'; //


class EmailSignUpTextFormField extends StatelessWidget {
  const EmailSignUpTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.email,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              onChanged: (value) {
                context
                    .read<SignUpBloc>()
                    .add(UserSignUpEmailAddressEvent(value));
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [
                AutofillHints.email,
              ],
              controller: context.read<SignUpBloc>().userSignUpEmailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    IconlyBroken.message,
                    size: 18.sp,
                  ),
                  hintText: AppStrings.emailExample,
                  errorText: state.whenOrNull(
                    userSignUpEmailAddress: (value) {
                      return value.isNotEmpty ? value : null;
                    },
                  )),
            )
          ],
        );
      },
    );
  }
}
