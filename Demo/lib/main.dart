import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loginController.dart';
import 'loginview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:LoginView(),
      initialBinding :BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    );
  }
}

