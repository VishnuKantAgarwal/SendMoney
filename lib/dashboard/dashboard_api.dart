import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:send_money/api/model/balance/balance.dart';

import '../api/web_service/api_client_const.dart';
import '../api/web_service/api_util_method.dart';
import '../api/web_service/constants.dart';
import '../api/web_service/type_action.dart';

class DashboardApi {
  GetStorage storage = Get.find();

  Future<void> balance(int id, Function? callBack) async {
    if(Get.isRegistered<Balance>(tag: BALANCE_DATA)){
      Balance balance = Get.find<Balance>(tag: BALANCE_DATA);
      if (callBack != null) {
        callBack(TypeActions.INSTANCE.SUCCESS, balance);
      }
    }
    else if(storage.hasData(BALANCE_DATA)){
      Balance balance = Balance.fromJson(storage.read(BALANCE_DATA));
      await Get.delete<Balance>(tag: BALANCE_DATA,force: true);
      await Get.putAsync<Balance>(() async {return balance;}, tag: BALANCE_DATA,permanent: true);
      if (callBack != null) {
        callBack(TypeActions.INSTANCE.SUCCESS, balance);
      }
    }

    await ApiClientConst.getApiClient()?.balance(id).then((response) async {
          if (response != null) {
            await Get.delete<Balance>(tag: BALANCE_DATA,force: true);
            await Get.putAsync<Balance>(() async {return response;}, tag: BALANCE_DATA,permanent: true);
              await storage.write(BALANCE_DATA, response.toJson());
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