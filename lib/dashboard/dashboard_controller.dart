import 'package:get/get.dart';
import 'package:send_money/api/model/balance/balance.dart';
import 'package:send_money/api/model/user/users.dart';
import 'package:send_money/dashboard/dashboard_api.dart';

import '../api/web_service/type_action.dart';
import '../widgets/utility.dart';

class DashboardController extends GetxController {
  DashboardApi api = DashboardApi();
  Users users= Get.find();
  var balance = Balance().obs;
  var isObscure =false.obs;

  @override
  void onInit() async {
    balanceApi();
    super.onInit();
  }

  Future<void> balanceApi() async {
    await api.balance( users.id??0, (action, response) async {

      if (action == TypeActions.INSTANCE.SUCCESS) {
        balance.value=response;
      }else if (action == TypeActions.INSTANCE.ERROR) {
        Utility.INSTANCE.dialogSingleButton("error", response, "Cancel");
      } else if (action == TypeActions.INSTANCE.NETWROK_ERROR) {
        Utility.INSTANCE.dialogSingleButton("Network Error", "No Internet Connection", "Cancel");
      }

    });
  }
}
