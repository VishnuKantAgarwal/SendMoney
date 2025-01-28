import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:send_money/api/model/balance/balance.dart';
import 'package:send_money/api/model/user/users.dart';
import 'package:send_money/dashboard/dashboard_api.dart';
import 'package:send_money/send_money/send_money_api.dart';

import '../api/web_service/type_action.dart';
import '../widgets/dialog_builder.dart';
import '../widgets/utility.dart';

class SendMoneyController extends GetxController {
  SendMoneyApi api = SendMoneyApi();
  Users users= Get.find();

  var amountError = "".obs;

  final TextEditingController  amountController = TextEditingController();


  Future<void> sendMoneyApi() async {
    DialogBuilder.INSTANCE.showLoadingIndicator('', 'Sending Money ...',isCancelabel: false);
    await api.sendMoney( amountController.text.trim(), (action, response) async {
      DialogBuilder.INSTANCE.hideOpenDialog();
      if (action == TypeActions.INSTANCE.SUCCESS) {
        Utility.INSTANCE.dialogSingleButton("Success", "Successfully Sent", "Cancel");
      }else if (action == TypeActions.INSTANCE.ERROR) {
        Utility.INSTANCE.dialogSingleButton("Error", response, "Cancel");
      } else if (action == TypeActions.INSTANCE.NETWROK_ERROR) {
        Utility.INSTANCE.dialogSingleButton("Network Error", "No Internet Connection", "Cancel");
      }

    });
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }
}
