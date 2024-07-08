class ApiConstants {
   static const String baseUrl = 'https://elminiawy-patisserie.vercel.app';
   static const int apiTimeOut = 120 * 1000;

  static const String login = '/v1/api/auth/login';
  static const String signup = '/v1/api/auth/signUp';
  static const String forgetPassword = '/v1/api/auth/forgetPassword';
  static const String verifyCode = '/v1/api/auth/verifyCode';
  static const String resetPassword = '/v1/api/auth/resetPassword';
  static const String getMissing = '/v1/api/missing';
  static const String getFound = '/v1/api/find';
  static const String updateMyImage = '/v1/api/user/updateMyImage';
  static const String updateMyPassword = '/v1/api/user/updateMyPassword';
  static const String updateMyData = '/v1/api/user/updateMyData';
  static const String getNotification = '/v1/api/notification';
}
