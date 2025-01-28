
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import '../themes/app_text_theme.dart';
import '../themes/theme_color.dart';
import '../themes/rheme_height_width.dart';
import '../widgets/rounded_text_field.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  //LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(20),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(150)),
                      child: Text(
                        "SIGN IN",
                        style: style700_28(color: Colors.white),
                      ),
                    ),
                    Text("Welcome Back !",
                        style: style700_24(
                            color: Colors.black)),
                    heightSpace_5,
                    Text("Login to your account",
                        style: style500_12(
                            color: gray_4)),
                    heightSpace_20,
                    RoundedTextField(
                      errorText: controller.userIdError.value.isNotEmpty ? controller.userIdError.value : null,
                      hintText: "User Name/Email Id",
                      textEditingController: controller.userIdController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 10, top: 20, bottom: 20),
                        child: Icon(Icons.mail),
                      ),
                    ),
                    heightSpace_30,
                    RoundedTextField(
                      errorText: controller.passwordError.value.isNotEmpty ? controller.passwordError.value : null,
                      hintText: "Password",
                      textEditingController: controller.passwordController,
                      isObscureText:  controller.passVisibility.value,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16.5),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 10, top: 16, bottom: 16),
                        child: Icon(Icons.lock),
                      ),
                      sufixIcon: IconButton(
                        icon:  Icon(
                          controller.passVisibility.value?
                          Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          controller.passVisibility.value = !controller.passVisibility.value;
                        },
                      ),
                    ),
                    heightSpace_30,
                    ElevatedButton(
                        onPressed: () {
                          controller.userIdError.value = "";
                          controller.passwordError.value = "";

                          if (controller.userIdController.text.trim().isEmpty) {
                            controller.userIdError.value = "Please enter valid user name or email id";
                            return;
                          } else if (controller.passwordController.text.trim().isEmpty) {
                            controller.passwordError.value = "Please enter password";
                            return;
                          }
                          controller.login();
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 50),
                            backgroundColor: primaryColor),
                        child: Text(
                          "SIGN IN",
                          style: style600_20(color: Colors.white),
                        )),

                    heightSpace_30,

                  ],
                )),
              ),
            ),
          ),
        )
    );
  }



}
