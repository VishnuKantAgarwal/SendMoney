import 'package:get/get.dart';
import 'package:send_money/send_money/send_money_binding.dart';
import 'package:send_money/send_money/send_money_page.dart';
import 'package:send_money/transaction/transaction_binding.dart';
import 'package:send_money/transaction/transaction_page.dart';
import '../dashboard/dashboard_binding.dart';
import '../dashboard/dashboard_page.dart';
import '../login/login_binding.dart';
import '../login/login_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [

    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.sendMoney,
      page: () => SendMoneyPage(),
      binding: SendMoneyBinding(),
    ),
    GetPage(
      name: AppRoutes.transaction,
      page: () => TransactionPage(),
      binding: TransactionBinding(),
    ),

  ];
}
