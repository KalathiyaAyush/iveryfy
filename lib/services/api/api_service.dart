// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../src/utils/folder_utils.dart';
import '../../src/utils/utility_helper.dart';
import 'dio_factory.dart';

part 'api_error.dart';
part 'api_helper.dart';
part 'api_request.dart';
part 'api_response.dart';

class APIService {
  APIService._();
  static final APIService instance = APIService._();

  Future<MultipartFile> _getMultipartFile(File file) async {
    String key;
    String type = FolderUtils.instance.getFileName(file.path);
    type = type.split('.')[1];
    if (type == 'pdf') {
      key = 'application';
    } else {
      key = 'image';
    }
    return MultipartFile.fromFile(file.path, contentType: MediaType(key, type));
  }

  Future<Response<Map<String, dynamic>>?> _getResponse({
    required APIRequest request,
    FormData? formData,
  }) async {
    //await _setAuthorizationIfNull();
    // request.header ??= headers;

    final dio = await DioFactory().getDio();
    switch (request.methodType) {
      case MethodType.GET:
        return dio.get(
          request.url,
          options: Options(
            headers: request.header,
          ),
          queryParameters: request.queryParams,
        );

      case MethodType.POST:
        return dio.post(
          request.url,
          options: Options(headers: request.header),
          data: formData ?? request.paramList ?? request.params,
          queryParameters: request.queryParams,
        );

      case MethodType.PATCH:
        return dio.patch(
          request.url,
          options: Options(headers: request.header),
          data: formData ?? request.params,
          queryParameters: request.queryParams,
        );

      case MethodType.PUT:
        return dio.put(
          request.url,
          options: Options(headers: request.header),
          data: formData ?? request.params,
          queryParameters: request.queryParams,
        );

      case MethodType.DELETE:
        return dio.delete(
          request.url,
          options: Options(headers: request.header),
          data: formData ?? request.params,
          queryParameters: request.queryParams,
        );
      default:
        return null;
    }
  }

  // Future<APIResponse> _authorizeTheUser(
  //   APIRequest request, {
  //   Function(dynamic)? create,
  // }) async {
  //   await refreshTokenFromServer();
  //   return callService(request, create: create);
  // }

  Future<APIResponse<dynamic>> callService(
    APIRequest request, {
    Function(dynamic data)? create,
  }) async {
    try {
      if (await UtilityHelper.checkInternet()) {
        FormData? formData;
        if (request.file != null) {
          formData = FormData.fromMap(request.params ?? {});
          formData.files.add(
            MapEntry<String, MultipartFile>(
              'file',
              await _getMultipartFile(request.file!),
            ),
          );
        }

        final Response<Map<String, dynamic>>? response =
            await _getResponse(request: request, formData: formData);

        if (response != null) {
          if (response.statusCode! >= 200 && response.statusCode! <= 299) {
            return APIResponse<dynamic>.fromJson(
              response.data!,
              create: create,
            );
          }
          return APIResponse<dynamic>.fromJson(
            response.data!,
            create: create,
          );
        }
        return APIResponse<dynamic>.custom(
          message: APIConstError.kSomethingWentWrong,
        );
      } else {
        return APIResponse<dynamic>.custom(
          message: APIConstError.kNoInternetConnection,
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final APIResponse<dynamic> errorModel = APIResponse<dynamic>.fromJson(
          e.response!.data as Map<String, dynamic>,
          create: create,
        );
        return errorModel;
      }
      return APIResponse<dynamic>.custom(
        message: ErrorHandler.instance.getDioError(e),
      );
    } catch (e) {
      return APIResponse<dynamic>.custom(
        message: APIConstError.kSomethingWentWrong,
      );
    }
  }
}
