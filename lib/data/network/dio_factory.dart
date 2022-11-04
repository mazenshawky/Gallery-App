import 'package:gallery_app/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "Content-Type";
const String ACCEPT = "Accept";
const String AUTHORIZATION = "Authorization";

class DioFactory {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  Future<Dio> getDio() async {
    Dio dio = Dio();

    String dioToken = "Bearer ";

    dioToken += await _appPreferences.getToken();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: dioToken,
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: Constants.apiTimeOut,
        sendTimeout: Constants.apiTimeOut,
    );

    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
