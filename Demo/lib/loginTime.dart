import 'package:demo/draw.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'logintimeController.dart';

class LoginTimePage extends GetView<LoginTimeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Time Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
            children: [
              Text(
                'Login Time: ${DateFormat('MMMM d, yyyy   hh:mm:ss a').format(controller.loginTime.value)}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(onPressed: (){
                Get.off(Drawers());
              },
                  child: Text('press'))
            ],
          ),
        ),
    );
  }
}
