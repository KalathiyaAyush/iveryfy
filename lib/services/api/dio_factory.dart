// ignore_for_file: constant_identifier_names
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/foundation.dart';

import '../pref/pref_service.dart';

const String kAPPLICAITON_JSON = 'application/json';
const String kCONTENT_TYPE = 'content-type';
const String kACCEPT = 'accept';
const String kAUTHORIZATION = 'authorization';

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    final token =
        PreferenceService.instance.getStringPrefValue(key: PrefKeys.token);

    Dio dio = Dio();
    int timeOut = 60 * 1000; // 1 mints
    Map<String, String> headers = {
      kCONTENT_TYPE: kAPPLICAITON_JSON,
      kACCEPT: kAPPLICAITON_JSON,
      if (token.isNotEmpty) kAUTHORIZATION: token,
    };
    dio.options = BaseOptions(
      sendTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers,
    );
    if (kReleaseMode) {
      log('Release mode no logs!!');
    } else {
      dio.interceptors.add(HttpFormatter());
    }
    return dio;
  }
}
