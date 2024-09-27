import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/log_out_cubit.dart';
import '../refactor/profile_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<LogOutCubit>().getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileBody(),
    );
  }
}
