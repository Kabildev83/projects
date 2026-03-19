import 'homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionTimerContent extends GetView<HomeController> {
 RxInt sessionDuration;
  SessionTimerContent({required this.sessionDuration});

  @override
  Widget build(BuildContext context) {
    controller.updateDuration(sessionDuration.value);
    return Scaffold(
        appBar: AppBar(
          title: Text('Session timer',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.lightGreen,
        ),
     body: Center(
      child: Obx(() {
        final Duration duration = controller.formattedDuration.value;
        return Text(
          'Session Duration: ${duration.inHours}:${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        );
      }),
     )
    );
  }
}