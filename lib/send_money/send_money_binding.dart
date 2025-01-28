import 'package:get/get.dart';

import 'send_money_controller.dart';

class SendMoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendMoneyController());
  }

}