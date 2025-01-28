

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:send_money/api/model/transaction/transaction.dart';
import 'package:send_money/api/model/user/users.dart';
import '../api/model/balance/balance.dart';
import '../routes/app_routes.dart';
import '../themes/app_text_theme.dart';
import '../themes/theme_color.dart';

enum Utility {
  INSTANCE;


 void dialogSingleButtonBackScreen(String title, String msg, String btn) {
    Get.defaultDialog(
        title: title,
        radius: 15,
        onWillPop: () {
          return Future.value(false);
        },
        barrierDismissible: false,
        titlePadding: const EdgeInsets.only(top: 18),
        contentPadding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        middleText: msg,
        middleTextStyle: style900_16(wordSpacing: 2, color: Colors.black),
        cancel: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: ElevatedButton(
              onPressed: () {
                Get.back(canPop: true, closeOverlays: true);
              },
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all(const Size(150, 40)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: const BorderSide(color: green_2)))),
              child: Text(
                btn,
                style: style800_15(color: green_2),
              )),
        ));
  }

  void dialogSingleButton(String title, String msg, String btn) {
    if (Get.isDialogOpen == false) {
      Get.defaultDialog(
          title: title,
          radius: 15,
          /* onWillPop: () {
          return Future.value(false);
        },*/
          barrierDismissible: false,
          titlePadding: const EdgeInsets.only(top: 18),
          contentPadding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          middleText: msg,
          middleTextStyle: style900_16(wordSpacing: 2, color: Colors.black),
          cancel: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.back(canPop: true);
                },
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    minimumSize: MaterialStateProperty.all(const Size(150, 40)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(color: green_2)))),
                child: Text(
                  btn,
                  style: style800_15(color: green_2),
                )),
          ));
    }
  }

  void dialogDoubleCustomButton(String title, String msg, String positive,
      String negative, Function callBack) {
    Get.defaultDialog(
        radius: 15,
        title: title,
        titlePadding: const EdgeInsets.only(top: 18),
        contentPadding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        middleText: msg,
        middleTextStyle: style900_16(wordSpacing: 2, color: Colors.black),
        cancel: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.back(canPop: true);
                    if (callBack != null) {
                      callBack("");
                    }

                    /* Get.to(LoginRegisterScreen());*/
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      minimumSize:
                          MaterialStateProperty.all(const Size(100, 40)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: green_2)))),
                  child: Text(
                    positive,
                    style: style800_12(color: green_2),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Get.back(canPop: true);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      minimumSize:
                          MaterialStateProperty.all(const Size(100, 40)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: gray_4)))),
                  child: Text(
                    negative,
                    style: style800_12(color: gray_4),
                  )),
            ],
          ),
        ));
  }

  String amountWithRupees(dynamic value) {
    String num = value.toString();
    if (num.isNotEmpty) {
      if (num.contains(".")) {
        String postfixValue = num.substring(num.indexOf("."));
        if (postfixValue == ".0") {
          return "\u20B9 ${num.replaceAll(".0", "").trim()}";
        } else if (postfixValue == ".00") {
          return "\u20B9 ${num.replaceAll(".00", "").trim()}";
        } else if (postfixValue == ".000") {
          return "\u20B9 ${num.replaceAll(".000", "").trim()}";
        } else if (postfixValue == ".0000") {
          return "\u20B9 ${num.replaceAll(".0000", "").trim()}";
        } else if (postfixValue == ".00000") {
          return "\u20B9 ${num.replaceAll(".00000", "").trim()}";
        } else if (postfixValue == ".000000") {
          return "\u20B9 ${num.replaceAll(".000000", "").trim()}";
        } else if (postfixValue == ".0000000") {
          return "\u20B9 ${num.replaceAll(".0000000", "").trim()}";
        } else if (postfixValue == ".00000000") {
          return "\u20B9 ${num.replaceAll(".00000000", "").trim()}";
        } else if (postfixValue == ".000000000") {
          return "\u20B9 ${num.replaceAll(".000000000", "").trim()}";
        } else {
          try {
            return "\u20B9 ${value.toStringAsFixed(2).replaceAll(RegExp("0*\$"), "")}";
          } catch (e) {
            return "\u20B9 ${num.trim()}";
          }
        }
      } else {
        return "\u20B9 ${num.trim()}";
      }
    } else {
      return "\u20B9 0";
    }
  }

  String amountWithOutRupees(dynamic value) {
    String num = "";
    if (value is double) {
      num = value.toString();
    } else {
      num = value;
    }
    if (num.isNotEmpty) {
      if (num.contains(".")) {
        String postfixValue = num.substring(num.indexOf("."));
        if (postfixValue == ".0") {
          return num.replaceAll(".0", "").trim();
        } else if (postfixValue == ".00") {
          return num.replaceAll(".00", "").trim();
        } else if (postfixValue == ".000") {
          return num.replaceAll(".000", "").trim();
        } else if (postfixValue == ".0000") {
          return num.replaceAll(".0000", "").trim();
        } else if (postfixValue == ".00000") {
          return num.replaceAll(".00000", "").trim();
        } else if (postfixValue == ".000000") {
          return num.replaceAll(".000000", "").trim();
        } else if (postfixValue == ".0000000") {
          return num.replaceAll(".0000000", "").trim();
        } else if (postfixValue == ".00000000") {
          return num.replaceAll(".00000000", "").trim();
        } else if (postfixValue == ".000000000") {
          return num.replaceAll(".000000000", "").trim();
        } else {
          try {
            return value.toStringAsFixed(2).replaceAll(RegExp("0*\$"), "");
          } catch (e) {
            return num.trim();
          }
        }
      } else {
        return num.trim();
      }
    } else {
      return "0";
    }
  }

  showSnackBar(String title, String msg, Color? bgColor) {
    if (Get.isSnackbarOpen) {
      return;
    }

    Get.snackbar(
      title,
      msg,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      titleText: Text(title,
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900)),
      messageText: Text(msg,
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700)),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: bgColor ?? Colors.black,
    );
  }

  Future<void> logout(GetStorage storage) async {
    await storage.erase();
    await Get.delete(force: true);
    await Get.delete<Users>(force: true);
    await Get.delete<Balance>(force: true);
    await Get.delete<Transaction>(force: true);

    await Get.offAllNamed(AppRoutes.login);
  }



 String formatDate(DateTime? value,String format) {
   return DateFormat(format).format(value??DateTime.now());
 }


}
