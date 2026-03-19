import 'package:flutter/material.dart';
import 'package:fluttergetx/logincontroller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  final loginController = Get.find<LoginController>();
  return Scaffold(
    appBar: AppBar(
      title: Text('HomePage'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Email : ${loginController.emailController.value}'),
          Text('Password : ${loginController.passwordController.value}'),
        ],
      ),
    ),
  );
  }
}