

import '../../../../../core/common/shared/shared_imports.dart'; //

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(child: VerificationCodeBody()),
    );
  }
}
