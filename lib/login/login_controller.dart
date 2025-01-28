import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:send_money/api/model/user/users.dart';
import 'package:send_money/api/web_service/constants.dart';
import '../api/web_service/type_action.dart';
import '../routes/app_routes.dart';
import '../widgets/dialog_builder.dart';
import '../widgets/utility.dart';
import 'login_api.dart';

 class LoginController extends GetxController {
   GetStorage storage = Get.find();

  var userIdError ="".obs;
  var passwordError ="".obs;
  var passVisibility=true.obs;

  final TextEditingController  userIdController = TextEditingController();
  final TextEditingController  passwordController = TextEditingController();




  LoginApi api = LoginApi();
  @override
  void onInit() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(storage.hasData(LOGIN_DATA)){
        Users users = Users.fromJson(storage.read(LOGIN_DATA));
        Get.put(users, permanent: true);
        Get.offAllNamed(AppRoutes.dashboard);
      }
    });

    super.onInit();

  }



  Future<void> login() async {
    DialogBuilder.INSTANCE.showLoadingIndicator('', 'Authenticating ...',isCancelabel: false);
    await api.login(storage, userIdController.text.trim(),passwordController.text.trim(), (action, response) async {
      DialogBuilder.INSTANCE.hideOpenDialog();
      if (action == TypeActions.INSTANCE.SUCCESS) {
        Get.offAllNamed(AppRoutes.dashboard);
      }else if (action == TypeActions.INSTANCE.ERROR) {
        Utility.INSTANCE.dialogSingleButton("error", response, "Cancel");
      } else if (action == TypeActions.INSTANCE.NETWROK_ERROR) {
        Utility.INSTANCE.dialogSingleButton("Network Error", "No Internet Connection", "Cancel");
      }

    });
  }




  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();

    super.dispose();
  }


}