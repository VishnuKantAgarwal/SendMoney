import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_money/api/model/transaction/transaction.dart';
import 'package:send_money/themes/app_text_theme.dart';
import 'package:send_money/themes/theme_color.dart';
import 'package:send_money/transaction/transaction_controller.dart';
import 'package:send_money/widgets/utility.dart';



class TransactionPage extends StatelessWidget {

  TransactionController controller =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
          title: Text("Transactions", style: style600_18(color: Colors.white))),
      body: Obx(() => controller.transaction.value.list!=null?
      ListView.builder(
        itemCount: controller.transaction.value.list!.length,
        itemBuilder: (context, index) {
          Transaction item = controller.transaction.value.list![index];
          return Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: gray_1,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(Utility.INSTANCE.amountWithRupees(item.amount??0.0),
                  style: style600_18(color: Colors.red),),
                ),
                Text(item.time??"",
                  style: style500_14(color: Colors.black),),

              ],
            ),
          );
        },):
      Center(child: Text("No Data",style: style500_20(color: gray_3))))
    );
  }
}