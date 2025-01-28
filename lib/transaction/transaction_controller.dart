import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:send_money/api/model/balance/balance.dart';
import 'package:send_money/api/model/transaction/transaction.dart';
import 'package:send_money/api/model/user/users.dart';
import 'package:send_money/dashboard/dashboard_api.dart';
import 'package:send_money/send_money/send_money_api.dart';
import 'package:send_money/transaction/transaction_api.dart';

import '../api/web_service/type_action.dart';
import '../widgets/dialog_builder.dart';
import '../widgets/utility.dart';

class TransactionController extends GetxController {
  TransactionApi api = TransactionApi();
  Users users= Get.find();
  var transaction = Transaction().obs;

  @override
  void onInit() async {
    transactionApi();
    super.onInit();
  }
  Future<void> transactionApi() async {
    //DialogBuilder.INSTANCE.showLoadingIndicator('', 'Getting Transaction ...',isCancelabel: false);
    await api.transaction( users.id??0, (action, response) async {
     // DialogBuilder.INSTANCE.hideOpenDialog();
      if (action == TypeActions.INSTANCE.SUCCESS) {
        transaction.value=response;
      }else if (action == TypeActions.INSTANCE.ERROR) {
        Utility.INSTANCE.dialogSingleButton("Error", response, "Cancel");
      } else if (action == TypeActions.INSTANCE.NETWROK_ERROR) {
        Utility.INSTANCE.dialogSingleButton("Network Error", "No Internet Connection", "Cancel");
      }

    });
  }
}
