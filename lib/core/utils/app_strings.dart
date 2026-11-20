class AppStrings {
  AppStrings._();

  static const String appName = 'Tadbirrah';
  static const String defaultFontFamily = 'Cairo';

  // Storage Keys
  static const String tokenKey = 'user_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String onboardingSeenKey = 'is_onboarding_seen';
  static const String userLanguageKey = 'app_language';
  static const String userThemeModeKey = 'app_theme_mode';

  // Navigation
  static const String home = 'Home';
  static const String search = 'Search';
  static const String profile = 'Profile';

  // General Error Messages
  static const String badRequestError = 'Bad request. Please check your data and try again.';
  static const String unauthorizedError = 'Unauthorized access. Please login again.';
  static const String forbiddenError = 'Access forbidden. You do not have permission.';
  static const String notFoundError = 'Requested resource not found.';
  static const String conflictError = 'Conflict detected. Please check duplicate entries.';
  static const String internalServerError = 'Internal server error. Please try again later.';
  static const String connectionTimeoutError = 'Connection timeout. Check your internet connection.';
  static const String sendTimeoutError = 'Send timeout occurred. Try again.';
  static const String receiveTimeoutError = 'Receive timeout occurred. Try again.';
  static const String noInternetError = 'No internet connection. Please connect and try again.';
  static const String unexpectedError = 'An unexpected error occurred. Please try again.';
  static const String formatError = 'Invalid response format from server.';
}
