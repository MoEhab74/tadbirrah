import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api/api_consumer.dart';
import '../api/api_endpoints.dart';
import '../api/dio_consumer.dart';
import '../api/dio_interceptor.dart';
import '../cache/secure_cache_helper.dart';
import 'is_logged_in_service.dart';
import 'onboarding_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Storage
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  getIt.registerLazySingleton<SecureCacheHelper>(
    () => SecureCacheHelper(secureStorage: getIt<FlutterSecureStorage>()),
  );

  // Services
  getIt.registerLazySingleton<IsLoggedInService>(
    () => IsLoggedInService(secureCacheHelper: getIt<SecureCacheHelper>()),
  );

  getIt.registerLazySingleton<OnboardingService>(
    () => OnboardingService(),
  );

  // Dio & Interceptors
  getIt.registerLazySingleton<DioInterceptor>(
    () => DioInterceptor(secureCacheHelper: getIt<SecureCacheHelper>()),
  );

  getIt.registerLazySingleton<PrettyDioLogger>(
    () => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ),
  );

  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: ApiEndpoints.connectTimeout,
        receiveTimeout: ApiEndpoints.receiveTimeout,
        sendTimeout: ApiEndpoints.sendTimeout,
      ),
    );

    dio.interceptors.addAll([
      getIt<DioInterceptor>(),
      getIt<PrettyDioLogger>(),
    ]);

    return dio;
  });

  // API Consumer
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>()),
  );
}
