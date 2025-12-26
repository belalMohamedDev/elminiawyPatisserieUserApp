import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'user_notification_state.dart';
part 'user_notification_cubit.freezed.dart';

class UserNotificationCubit extends Cubit<UserNotificationState> {
  List<UserNotificationData> dataList = [];

  UserNotificationCubit(this._repository)
    : super(const UserNotificationState.initial());

  final UserNotificationRepositoryImplement _repository;

  Future<void> updateAllNotificationsToSeen() async {
    if (isClosed) return;

    emit(const UserNotificationState.userNotificationLoading());

    final result = await _repository.updateAllUserNotificationToSeenRepo();

    if (isClosed) return;

    result.when(
      success: (data) {
        if (isClosed) return;
        dataList = [];
        dataList.addAll(data.data!);
        emit(UserNotificationState.userNotificationLoaded(data));
      },
      failure: (error) {
        if (isClosed) return;
        emit(UserNotificationState.userNotificationError(error));
      },
    );
  }

  Future<void> deleteUserNotification(String id) async {
    if (isClosed) return;

    emit(const UserNotificationState.deleteUserNotificationLoading());

    final result = await _repository.deleteUserNotificationRepo(id);

    if (isClosed) return;

    result.when(
      success: (data) {
        if (isClosed) return;
        dataList = [];
        dataList.addAll(data.data!);

        emit(UserNotificationState.deleteUserNotificationLoaded(data));
      },
      failure: (error) {
        if (isClosed) return;
        emit(UserNotificationState.deleteUserNotificationError(error));
      },
    );
  }
}
