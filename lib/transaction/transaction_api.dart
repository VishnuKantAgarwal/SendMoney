import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:send_money/api/model/transaction/transaction.dart';


import '../api/web_service/api_client_const.dart';
import '../api/web_service/api_util_method.dart';
import '../api/web_service/constants.dart';
import '../api/web_service/type_action.dart';

class TransactionApi {
  GetStorage storage = Get.find();

  Future<void> transaction(int id, Function? callBack) async {
    if(Get.isRegistered<Transaction>(tag: TRANSACTION_DATA)){
      Transaction transaction = Get.find<Transaction>(tag: TRANSACTION_DATA);
      if (callBack != null) {
        callBack(TypeActions.INSTANCE.SUCCESS, transaction);
      }
    }
    else if(storage.hasData(TRANSACTION_DATA)){
      Transaction transaction = Transaction.fromJson(storage.read(TRANSACTION_DATA));
      await Get.delete<Transaction>(tag: TRANSACTION_DATA,force: true);
      await Get.putAsync<Transaction>(() async {return transaction;}, tag: TRANSACTION_DATA,permanent: true);
      if (callBack != null) {
        callBack(TypeActions.INSTANCE.SUCCESS, transaction);
      }
    }

    await ApiClientConst.getApiClient()?.getTransaction(id).then((response) async {
          if (response != null) {
            await Get.delete<Transaction>(tag: TRANSACTION_DATA,force: true);
            await Get.putAsync<Transaction>(() async {return response;}, tag: TRANSACTION_DATA,permanent: true);
            await storage.write(TRANSACTION_DATA, response.toJson());
              if (callBack != null) {
                callBack(TypeActions.INSTANCE.SUCCESS, response);
              }
          } else {
            if (callBack != null) {
              callBack(TypeActions.INSTANCE.ERROR, SOMETHING_WRONG);
            }
          }
        }, onError: (e) {
      ApiUtiMethod.INSTANCE.handleError(e, callBack); // Original error.// Oops, new error.
    }).catchError((Object obj) {
      ApiUtiMethod.INSTANCE.handleError(obj, callBack);
    });
  }
}