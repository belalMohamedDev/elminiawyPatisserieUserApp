import 'package:elminiawy/feature/notification/data/model/user_notification_resp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/repository/user_notification_repo.dart';

part 'user_notification_state.dart';
part 'user_notification_cubit.freezed.dart';

class UserNotificationCubit extends Cubit<UserNotificationState> {
  UserNotificationCubit(this._repository)
      : super(const UserNotificationState.initial());

  final UserNotificationRepository _repository;

  int isSeenDataLength = 0;

  void fetchNotifications() async {
    emit(const UserNotificationState.userNotificationLoading());

    final result = await _repository.getAllUserNotificationRepo();

    result.when(
      success: (data) {
        emit(UserNotificationState.userNotificationLoaded(data));
      },
      failure: (error) {
        emit(UserNotificationState.userNotificationError(
            errorMessage: error.message!, statesCode: error.statusCode!));
      },
    );
  }
}
