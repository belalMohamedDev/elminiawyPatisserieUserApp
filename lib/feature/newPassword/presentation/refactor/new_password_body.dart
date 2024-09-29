
import '../../../../../core/common/shared/shared_imports.dart'; //

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 100.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              AppStrings.newPassword,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              AppStrings.youNewPasswordMustBeDifferent,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            Column(
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
                const NewPasswordTextFormField()
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            const ConfirmNewPasswordTextFormField(),
            SizedBox(
              height: 35.h,
            ),
            const NewPasswordButton(),
          ],
        ),
      ),
    );
  }
}

