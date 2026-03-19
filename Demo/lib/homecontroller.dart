import 'package:demo/chartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'UserController.dart';
import 'loginController.dart';
import 'logintimeController.dart';
import 'loginview.dart';
import 'dart:async';


class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late UserController userController;
  late LoginTimeController loginTimeController;
  late ChartsController chartsController;
  late TabController tabController;
  RxInt seconds = 0.obs;
  late Timer _timer;
  Rx<Duration> formattedDuration = Duration(seconds: 0).obs;

  void updateDuration(int sessionDuration) {
    formattedDuration.value = Duration(seconds: sessionDuration);
  }

  void onInit(){
    super.onInit();
    tabController = TabController(length: 4, vsync:this);
    startTimer();
    userController = Get.put(UserController());
    loginTimeController = Get.put(LoginTimeController());
    chartsController = Get.put(ChartsController());
  }

  @override
  void onClose(){
    _timer.cancel();
    super.onClose();
    tabController.dispose();
  }

  var currentIndex = 0.obs;

  void changeTabIndex(int index) {
   currentIndex.value = index;
   update();
  }
  void handleback(){
    Get.lazyPut<LoginController>(() => LoginController());
    Get.off(() => LoginView());
  }
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      seconds.value++;
      update();
    });
  }

}
