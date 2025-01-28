import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/web_service/api_client_const.dart';
import '../api/web_service/api_util_method.dart';
import '../api/web_service/constants.dart';
import '../api/web_service/type_action.dart';

class LoginApi {


  Future<void> login(GetStorage storage, String userid, String password, Function? callBack) async {
    await ApiClientConst.getApiClient()?.users(userid, password).then(
        (response) async {
      if (response != null) {
        if (response.isNotEmpty) {
          Get.put(response[0], permanent: true);
          await storage.write(LOGIN_DATA, response[0].toJson());
          if (callBack != null) {
            callBack(TypeActions.INSTANCE.SUCCESS, response);
          }
        } else {
          if (callBack != null) {
            callBack(TypeActions.INSTANCE.ERROR, "User is not available");
          }
        }
      } else {
        if (callBack != null) {
          callBack(TypeActions.INSTANCE.ERROR, SOMETHING_WRONG);
        }
      }
    }, onError: (e) {
      ApiUtiMethod.INSTANCE
          .handleError(e, callBack); // Original error.// Oops, new error.
    }).catchError((Object obj) {
      ApiUtiMethod.INSTANCE.handleError(obj, callBack);
    });
  }
}
