import 'package:flutter/material.dart';

import '../refactor/verification_code_body.dart';

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
