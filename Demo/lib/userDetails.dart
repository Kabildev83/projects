import 'package:demo/customButton.dart';
import 'UserController.dart';
import 'base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserDetails extends GetView<UserController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (controller) {
        final storedEmail = StorageService().getStoredEmail() ?? '';
        final storedPassword = StorageService().getStoredPassword() ?? '';

        return Scaffold(
          appBar: AppBar(
            title: Text('LoginApp'),
            backgroundColor: Colors.deepPurple,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Visibility(
                    visible: controller.showUserDetails.value,
                    child: Column(
                      children: [
                        Text(
                          'Email: $storedEmail',
                          style: TextStyle(fontSize: 24, color: Colors.blueAccent),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Password: $storedPassword',
                          style: TextStyle(fontSize: 24, color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: true,
                      groupValue: controller.showUserDetails.value,
                      onChanged: (value) {
                        controller.toggleShowUserDetails(true);
                      },
                    ),
                    Text('Show'),
                    Radio(
                      value: false,
                      groupValue: controller.showUserDetails.value,
                      onChanged: (value) {
                        controller.toggleShowUserDetails(false);
                      },
                    ),
                    Text('Hide'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}