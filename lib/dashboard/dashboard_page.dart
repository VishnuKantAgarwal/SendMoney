import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_money/dashboard/dashboard_controller.dart';
import 'package:send_money/routes/app_routes.dart';
import 'package:send_money/themes/app_text_theme.dart';
import 'package:send_money/themes/rheme_height_width.dart';
import 'package:send_money/themes/theme_color.dart';
import 'package:send_money/widgets/utility.dart';

class DashboardPage extends StatelessWidget {
  DashboardController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
                onPressed: () => Utility.INSTANCE.dialogDoubleCustomButton(
                        "Logout",
                        "Are you sure you want to logout?",
                        "Logout",
                        "Cancel", (value) {
                      Utility.INSTANCE.logout(Get.find());
                    }),
                icon: Icon(Icons.power_settings_new))
          ],
          backgroundColor: primaryColor,
          title: Text("Home", style: style600_18(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: gray_1
              ),
              child: Column(
                children: [
                  Text(controller.users.name??"",style: style600_18(color: Colors.black),),
                  Text(controller.users.username??"",style: style600_18(color: Colors.black),)
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Text("Balance",
                        style: style700_16(color: Colors.black))),
                Obx(() => Text(
                    controller.isObscure == true
                        ? Utility.INSTANCE
                            .amountWithRupees(
                                controller.balance.value.amount ?? 0)
                            .replaceAll(RegExp(r"."), "*")
                        : Utility.INSTANCE.amountWithRupees(
                            controller.balance.value.amount ?? 0),
                    style: style700_16(color: Colors.black))),
                widthSpace_10,
                IconButton(
                    onPressed: () => controller.isObscure.value =
                        !controller.isObscure.value,
                    icon: Icon(Icons.visibility))
              ],
            ),
            heightSpace_20,
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.sendMoney),
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              child: Text(
                "Send Money",
                style: style600_14(color: Colors.white),
              ),
            ),
            heightSpace_20,
            ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.transaction),
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                child: Text("View Transaction",
                    style: style600_14(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
