import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'customButton.dart';
import 'loginController.dart';
import 'customTextField.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login APP'),
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: GetBuilder<LoginController>(
          builder: (_) {
            return Form(
              key: _.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Image.asset(
                      'assets/images/login.png',
                      width: 100,
                    ),
                  ),
                  CustomTextField(
                    name: 'Email',
                    controller: _.emailController,
                    isPassword: false,
                    obscureText: false,
                  ),
                  CustomTextField(
                    name: 'Password',
                    controller: _.passwordController,
                    isPassword: true,
                    obscureText: _.obscureText.value,
                    togglePasswordVisibility: _.togglePasswordVisibility,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Obx(() =>
                        Checkbox(
                          value: _.rememberMe.value,
                          onChanged: (value) {
                         _.rememberMe.value = value!;
                          },
                        ),
                        ),
                        Text('Remember Me'),
                      ],
                    ),
                  ),
                  Obx(
                        () {
                      return controller.showProgress.value
                          ? CircularProgressIndicator()
                          : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 16,
                        ),
                        child: Center(
                          child: CustomButton(
                            onPressed: () => controller.handleLogin(),
                            text: 'Login',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
