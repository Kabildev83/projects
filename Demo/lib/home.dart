import 'package:demo/charts.dart';
import 'package:demo/customButton.dart';
import 'package:demo/draw.dart';
import 'package:demo/homecontroller.dart';
import 'package:demo/loginTime.dart';
import 'package:demo/sessionduration.dart';
import 'package:demo/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          CustomButton(
            text: 'Back',
            onPressed: () => controller.handleback(),
            color: Colors.red,
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return TabBar(
                controller: controller.tabController,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: 'User Details'),
                  Tab(icon: Icon(Icons.ac_unit_rounded), text: 'Login Time'),
                  Tab(icon: Icon(Icons.timer), text: 'Session Timer'),
                  Tab(icon: Icon(Icons.add_chart_sharp),text: 'Charts'),
                ],
              );
            },
          ),
        ),
      ),
      body:TabBarView(
          controller: controller.tabController,
          children: [
                UserDetails(),
               LoginTimePage(),
              SessionTimerContent(sessionDuration: controller.seconds),
               Charts(),
          ],
        ),
      drawer: Drawers(),

    );
  }
}
