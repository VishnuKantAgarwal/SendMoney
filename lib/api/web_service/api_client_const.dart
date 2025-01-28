import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_client.dart';

class ApiClientConst {
  static ApiClient? api;
 static ApiClient? getApiClient({String? token,bool? isRecreate}){
    if(api==null || isRecreate==true){
      Dio dio = Dio();

      dio.options.connectTimeout=const Duration(seconds: 10);
      dio.options.receiveTimeout=const Duration(seconds: 10);
      dio.options.headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      };
      if(kDebugMode){
        dio.interceptors.add(PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90));
      }
      api = ApiClient(dio);
    }
    return api;
  }



}

