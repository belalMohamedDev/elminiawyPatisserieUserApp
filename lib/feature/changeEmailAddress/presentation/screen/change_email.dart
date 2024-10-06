import '../../../../../core/common/shared/shared_imports.dart'; //

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppStrings.changeEmailAddress,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 16.sp)),
          leading: IconButton(
            icon: const Icon(IconlyBroken.arrowLeft),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: const ChangeEmailBody());
  }
}
