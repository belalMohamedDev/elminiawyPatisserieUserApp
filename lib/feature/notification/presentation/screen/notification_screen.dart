import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/user_notification_cubit.dart';

class UserNotificationScreen extends StatefulWidget {
  const UserNotificationScreen({super.key});

  @override
  State<UserNotificationScreen> createState() => _UserNotificationScreenState();
}

class _UserNotificationScreenState extends State<UserNotificationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserNotificationCubit>().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const UserNotificationBody(),
    );
  }
}

class UserNotificationBody extends StatelessWidget {
  const UserNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
