import 'dart:async';
import '../data/repository/user_notification_repo.dart';
import '../data/model/user_notification_resp.dart';

class NotificationService {
  NotificationService(this._repository);
  final UserNotificationRepositoryImplement _repository;

  final StreamController<UserNotificationResponse> _notificationController =
      StreamController<UserNotificationResponse>.broadcast();
  Timer? _timer;

  Stream<UserNotificationResponse> get notificationStream =>
      _notificationController.stream;

  void fetchNotificationsContinuously() {
    _timer = Timer.periodic(const Duration(minutes: 30), (timer) async {
      try {
        final response = await _fetchNotifications();
        _notificationController.sink.add(response);
      } catch (error) {
        _notificationController.sink
            .addError('Failed to fetch notifications: $error');
      }
    });
  }

  Future<UserNotificationResponse> _fetchNotifications() async {
    final result = await _repository.getAllUserNotificationRepo();

    return result.when(
      success: (data) => data,
      failure: (error) {
        throw Exception('Failed to fetch notifications: ${error.message}');
      },
    );
  }

  void stopFetchingNotifications() {
    _timer?.cancel();
    _notificationController.close();
  }
}
