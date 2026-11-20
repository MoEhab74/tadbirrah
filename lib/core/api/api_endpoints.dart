class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.example.com/api/v1/';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Headers
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String accept = 'Accept';
  static const String acceptLanguage = 'Accept-Language';

  // Auth Endpoints
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String logout = 'auth/logout';
  static const String refreshToken = 'auth/refresh-token';
  static const String forgotPassword = 'auth/forgot-password';

  // Profile Endpoints
  static const String userProfile = 'user/profile';
  static const String updateProfile = 'user/profile/update';

  // Home Endpoints
  static const String homeData = 'home';
  static const String search = 'search';
}
