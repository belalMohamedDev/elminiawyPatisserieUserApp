
import '../../../../../core/common/shared/shared_imports.dart'; //

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LoginViewBody(),
    );
  }
}
