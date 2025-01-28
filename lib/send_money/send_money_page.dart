import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:send_money/dashboard/dashboard_controller.dart';
import 'package:send_money/send_money/send_money_controller.dart';
import 'package:send_money/themes/app_text_theme.dart';
import 'package:send_money/themes/rheme_height_width.dart';
import 'package:send_money/themes/theme_color.dart';
import 'package:send_money/widgets/utility.dart';

import '../widgets/rounded_text_field.dart';

class SendMoneyPage extends StatelessWidget {

  SendMoneyController controller =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
          title: Text("Send Money", style: style600_18(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Obx(() => RoundedTextField(
              errorText: controller.amountError.value.isNotEmpty ? controller.amountError.value : null,
              hintText: "Amount",
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              maxLength: 10,
              textEditingController: controller.amountController,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16.5),
            )),
            heightSpace_30,
            ElevatedButton(
                onPressed: () {
                  controller.amountError.value = "";


                  if (controller.amountController.text.trim().isEmpty) {
                    controller.amountError.value = "Please enter valid amount";
                    return;
                  }
                  controller.sendMoneyApi();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    backgroundColor: primaryColor),
                child: Text(
                  "Send Money",
                  style: style600_20(color: Colors.white),
                )),

          ],
        ),
      ),
    );
  }
}