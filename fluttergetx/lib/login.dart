import 'package:flutter/material.dart';
import 'package:fluttergetx/CustomEmailTextField.dart';
import 'package:fluttergetx/customelevatedButton.dart';
import 'logincontroller.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login APP'),
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/images/login.png',
                  width: 100,
                ),
        ),
            CustomTextField(
                labelText: 'Email',
                isPassword: false,
                  ),
              CustomTextField(
                labelText: 'Password',
                isPassword: true,
              ),
              SizedBox(height: 16.0),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 26),
                            child: Center(
                              child:CustomButton(
                                buttonName: 'Login',
                                routeName: '/home',
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                ),
       );
  }
}
