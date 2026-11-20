import 'package:dio/dio.dart';
import '../../utils/app_strings.dart';
import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  const ServerException({required this.errorModel});

  @override
  String toString() => errorModel.errorMessage;
}

ServerException handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 408,
          errorMessage: AppStrings.connectionTimeoutError,
        ),
      );
    case DioExceptionType.sendTimeout:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 408,
          errorMessage: AppStrings.sendTimeoutError,
        ),
      );
    case DioExceptionType.receiveTimeout:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 408,
          errorMessage: AppStrings.receiveTimeoutError,
        ),
      );
    case DioExceptionType.badCertificate:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 495,
          errorMessage: 'Bad SSL certificate detected.',
        ),
      );
    case DioExceptionType.badResponse:
      return _handleBadResponse(e.response);
    case DioExceptionType.cancel:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 499,
          errorMessage: 'Request was cancelled.',
        ),
      );
    case DioExceptionType.connectionError:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 503,
          errorMessage: AppStrings.noInternetError,
        ),
      );
    case DioExceptionType.unknown:
    default:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 500,
          errorMessage: AppStrings.unexpectedError,
        ),
      );
  }
}

ServerException _handleBadResponse(Response? response) {
  if (response == null) {
    return const ServerException(
      errorModel: ErrorModel(
        statusCode: 500,
        errorMessage: AppStrings.unexpectedError,
      ),
    );
  }

  final statusCode = response.statusCode ?? 500;
  final dynamic data = response.data;

  if (data is Map<String, dynamic>) {
    return ServerException(
      errorModel: ErrorModel.fromJson({
        'statusCode': statusCode,
        ...data,
      }),
    );
  }

  switch (statusCode) {
    case 400:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 400,
          errorMessage: AppStrings.badRequestError,
        ),
      );
    case 401:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 401,
          errorMessage: AppStrings.unauthorizedError,
        ),
      );
    case 403:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 403,
          errorMessage: AppStrings.forbiddenError,
        ),
      );
    case 404:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 404,
          errorMessage: AppStrings.notFoundError,
        ),
      );
    case 409:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 409,
          errorMessage: AppStrings.conflictError,
        ),
      );
    case 422:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 422,
          errorMessage: 'Unprocessable entity. Validation failed.',
        ),
      );
    case 500:
    case 502:
    case 503:
    case 504:
      return const ServerException(
        errorModel: ErrorModel(
          statusCode: 500,
          errorMessage: AppStrings.internalServerError,
        ),
      );
    default:
      return ServerException(
        errorModel: ErrorModel(
          statusCode: statusCode,
          errorMessage: 'Received invalid status code: $statusCode',
        ),
      );
  }
}
