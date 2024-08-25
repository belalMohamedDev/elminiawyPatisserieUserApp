import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const MyProfileBody(),
    );
  }
}


class MyProfileBody extends StatelessWidget {
  const MyProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}