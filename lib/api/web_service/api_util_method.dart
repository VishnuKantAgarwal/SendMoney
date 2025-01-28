import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../../routes/app_routes.dart';
import '../../themes/app_text_theme.dart';
import '../../themes/theme_color.dart';
import '../../widgets/dialog_builder.dart';
import 'type_action.dart';


enum ApiUtiMethod {
  INSTANCE;


  void handleError(Object obj, Function? callback) {
    if (obj.runtimeType == DioException) {
      DioException dioError = (obj as DioException);
      if (dioError.error is SocketException ||
          dioError.error is TimeoutException) {
        if (callback != null) {
          callback(
              TypeActions.INSTANCE.NETWROK_ERROR, dioError.message.toString());
        }
      } else if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.connectionError ||
          dioError.type == DioExceptionType.receiveTimeout ||
          dioError.type == DioExceptionType.sendTimeout) {
        if (callback != null) {
          callback(
              TypeActions.INSTANCE.NETWROK_ERROR, dioError.message.toString());
        }
      } else {
        if (callback != null) {
          if (dioError.response != null) {
            if (dioError.response!.statusCode == 401) {
              DialogBuilder.INSTANCE.hideOpenDialog();
              dialogAuthExpired(dioError.response!.statusMessage.toString());
            } else {
              if (dioError.response?.data != null &&
                  dioError.response?.data["responseText"] != null) {
                callback(TypeActions.INSTANCE.ERROR,
                    dioError.response?.data["responseText"]);
              } else if (dioError.response?.data != null &&
                  dioError.response?.data["message"] != null) {
                callback(TypeActions.INSTANCE.ERROR,
                    dioError.response?.data["message"]);
              } else {
                callback(
                    TypeActions.INSTANCE.ERROR,
                    ("${dioError.response!.statusCode}\n${dioError.response!.statusMessage}"));
              }
            }
          } else {
            callback(TypeActions.INSTANCE.ERROR, dioError.error.toString());
          }
        }
      }
    } else {
      if (callback != null) {
        callback(TypeActions.INSTANCE.ERROR, obj.toString());
      }
    }
  }
  List<dynamic> getError(Object obj) {
    if (obj.runtimeType == DioException) {
      DioException dioError = (obj as DioException);
      if (dioError.error is SocketException ||
          dioError.error is TimeoutException) {
        return [TypeActions.INSTANCE.NETWROK_ERROR, dioError.message.toString()];
      } else if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.connectionError ||
          dioError.type == DioExceptionType.receiveTimeout ||
          dioError.type == DioExceptionType.sendTimeout) {
        return [TypeActions.INSTANCE.NETWROK_ERROR,dioError.message.toString()];

      } else {

          if (dioError.response != null) {
            if (dioError.response!.statusCode == 401) {
              DialogBuilder.INSTANCE.hideOpenDialog();
              dialogAuthExpired(dioError.response!.statusMessage.toString());
              return [TypeActions.INSTANCE.ERROR,dioError.response!.statusMessage.toString()];
            } else {
             /* if (dioError.response?.data != null &&
                  dioError.response?.data["errorMsg"] != null) {
                return [TypeActions.INSTANCE.ERROR,dioError.response?.data["errorMsg"]];
              } else if (dioError.response?.data != null &&
                  dioError.response?.data["message"] != null) {
                return [TypeActions.INSTANCE.ERROR,dioError.response?.data["message"]];
              } else {*/
                return  [TypeActions.INSTANCE.ERROR,"${dioError.response!.statusCode}\n${dioError.response!.statusMessage}"];
              //}
            }
          } else {
            return [TypeActions.INSTANCE.ERROR,dioError.error.toString()];
          }

      }
    }
    return [TypeActions.INSTANCE.ERROR,obj.toString()];
  }

  void dialogAuthExpired(String title) {
    Get.defaultDialog(
        barrierDismissible: false,
        title: title,
        titlePadding: const EdgeInsets.only(top: 18),
        contentPadding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        middleText: "Session has been expired, Please Login again.",
        middleTextStyle: style900_16(
            wordSpacing: 2,
            color: Colors.black),
        cancel: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(Get.overlayContext!).pop();
                GetStorage().erase();
               Get.offAllNamed(AppRoutes.login);
              },
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all(const Size(150, 40)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(30.0),
                          side: const BorderSide(color: green_2)))),
              child:  Text(
                "Login",
                style: style600_15(color: green_2),
              )),
        ));
  }
}
