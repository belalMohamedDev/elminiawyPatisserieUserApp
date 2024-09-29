import '../../../../../core/common/shared/shared_imports.dart'; //


class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({
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
              AppStrings.phone,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              onChanged: (value) {
                context.read<SignUpBloc>().add(UserSignUpPhoneEvent(value));
              },
              textInputAction: TextInputAction.done,
              autofillHints: const [
                AutofillHints.telephoneNumber,
              ],
              keyboardType: TextInputType.phone,
              controller: context.read<SignUpBloc>().userSignUpPhone,
              decoration: InputDecoration(
                  prefixIcon: CountryCodePicker(
                    showFlagMain: false,
                    onChanged: (value) {
                      context.read<SignUpBloc>().countryCode = value.code!;
                    },
                    textStyle: TextStyle(color: ColorManger.black26),
                    initialSelection: '+20',
                    favorite: const ['+20', '+39', 'FR', '+966'],
                    flagWidth: 20.r,
                    flagDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(2.r)),
                    dialogBackgroundColor: ColorManger.white,
                    closeIcon: Icon(
                      Icons.close_rounded,
                      color: ColorManger.black54,
                    ),
                    showDropDownButton: true,
                  ),
                  hintText: AppStrings.enterPhoneNumber,
                  errorText: state.whenOrNull(
                    userSignUpPhone: (value) {
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
