import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.put(GetStorage(),permanent: true);
  }

}