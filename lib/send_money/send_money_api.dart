import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:send_money/widgets/utility.dart';

import '../api/web_service/api_client_const.dart';
import '../api/web_service/api_util_method.dart';
import '../api/web_service/constants.dart';
import '../api/web_service/type_action.dart';

class SendMoneyApi {


  Future<void> sendMoney(String amount, Function? callBack) async {
    await ApiClientConst.getApiClient()?.transaction({
      "amount": double.tryParse(amount)??0,
      "time": Utility.INSTANCE.formatDate(null, "dd MMM yyyy hh:mm a")
    }).then((response) async {
          if (response != null) {
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