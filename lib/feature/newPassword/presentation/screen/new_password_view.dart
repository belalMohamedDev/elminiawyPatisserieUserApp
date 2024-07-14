import 'package:flutter/material.dart';

import '../refactor/new_password_body.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const NewPasswordBody(),
    );
  }
}




