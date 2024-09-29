
import '../../../../../core/common/shared/shared_imports.dart'; //

class SignInWithAppleFaceBookAndGoogleButton extends StatelessWidget {
  const SignInWithAppleFaceBookAndGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatarIconButton(
          imagePath: ImageAsset.apple,
          function: () {},
        ),
        SizedBox(
          width: 10.w,
        ),
        CircleAvatarIconButton(
          imagePath: ImageAsset.google,
          function: () {},
        ),
        SizedBox(
          width: 10.w,
        ),
        CircleAvatarIconButton(
          imagePath: ImageAsset.faceBook,
          function: () {},
        )
      ],
    );
  }
}
