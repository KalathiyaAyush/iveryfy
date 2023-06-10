part of 'api_service.dart';

class APIResponse<T> {
  APIResponse({
    this.hasError,
    this.message,
    this.statusCode,
    this.data,
  });

  APIResponse.fromJson(
    Map<String, dynamic>? json, {
    Function(T)? create,
  }) {
    hasError = json?['hasError'] ?? false;
    message = json?['message'] ?? '';
    statusCode = json?['status'] ?? 0;
    data = (json?['data'] != null && create != null)
        ? create(
            json?['data'] as T,
          )
        : null;
  }

  factory APIResponse.custom({required String message}) {
    return APIResponse<T>(message: message, hasError: true);
  }

  bool? hasError;
  String? message;
  int? statusCode;
  dynamic data;
}
