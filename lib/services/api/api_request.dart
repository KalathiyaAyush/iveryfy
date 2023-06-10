part of 'api_service.dart';

class APIRequest {
  APIRequest({
    this.file,
    required this.url,
    required this.methodType,
    this.params,
    this.queryParams,
    this.header,
    this.paramList,
  });

  File? file;
  String url;
  MethodType methodType;
  Map<String, dynamic>? params;
  List<dynamic>? paramList;
  Map<String, dynamic>? queryParams;
  Map<String, dynamic>? header;
}
