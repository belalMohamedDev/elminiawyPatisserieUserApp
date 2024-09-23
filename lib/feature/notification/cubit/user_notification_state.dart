part of 'user_notification_cubit.dart';

@freezed
class UserNotificationState with _$UserNotificationState {
  const factory UserNotificationState.initial() = _Initial;


  const factory UserNotificationState.userNotificationLoading() = UserNotificationLoading;
  const factory UserNotificationState.userNotificationLoaded(UserNotificationResponse userNotificationResponse) = UserNotificationLoaded;
  const factory UserNotificationState.userNotificationError(
      {required int statesCode,
      required String errorMessage}) = UserNotificationError;
}
