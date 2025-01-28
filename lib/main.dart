import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:send_money/login/login_binding.dart';
import 'package:send_money/login/login_page.dart';
import 'package:send_money/themes/theme_color.dart';

import 'routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Send Money',
      theme: themeData,
      home: LoginPage(),
      initialBinding: LoginBinding(),
      getPages: AppPages.pages,
    );
  }
}

