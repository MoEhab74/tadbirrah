class ErrorModel {
  final int? statusCode;
  final String errorMessage;
  final dynamic errors;

  const ErrorModel({
    this.statusCode,
    required this.errorMessage,
    this.errors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: json['status'] ?? json['statusCode'] ?? json['code'],
      errorMessage: json['message'] ??
          json['errorMessage'] ??
          json['error'] ??
          'An unexpected error occurred.',
      errors: json['errors'] ?? json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'errorMessage': errorMessage,
      'errors': errors,
    };
  }

  @override
  String toString() =>
      'ErrorModel(statusCode: $statusCode, errorMessage: $errorMessage, errors: $errors)';
}
