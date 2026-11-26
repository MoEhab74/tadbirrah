import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  ApiEndpoints._();

  static const String supabaseUrl = 'https://wifwymrvolaxnqasyqfm.supabase.co';

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
}

class ApiKeys {
  ApiKeys._();

  static String? supabasePublishableKey =
      dotenv.env['SUPABASE_PUBLISHABLE_KEY'];
}
