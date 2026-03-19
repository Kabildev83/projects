import 'package:get/get.dart';
import 'package:flutter/material.dart';
class LoginController extends GetxController {
  var emailController = RxString('');
  var passwordController = RxString('');
  final RxBool obscureText = true.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
    update();// Toggle the value of obscureText
  }
}