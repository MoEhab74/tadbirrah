import 'package:dio/dio.dart';
import '../cache/secure_cache_helper.dart';
import '../utils/app_strings.dart';
import 'api_endpoints.dart';

class DioInterceptor extends Interceptor {
  final SecureCacheHelper secureCacheHelper;

  DioInterceptor({required this.secureCacheHelper});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers[ApiEndpoints.accept] = ApiEndpoints.applicationJson;
    options.headers[ApiEndpoints.contentType] = ApiEndpoints.applicationJson;

    final token = await secureCacheHelper.readSecureData(key: AppStrings.tokenKey);
    if (token != null && token.isNotEmpty) {
      options.headers[ApiEndpoints.authorization] = '${ApiEndpoints.bearer} $token';
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // You can handle global 401 Unauthorized token refresh logic here
    return handler.next(err);
  }
}
