import 'package:get/get.dart';

class HomeController extends GetxController{
  var _seconds = 0.obs;
  int get seconds => _seconds.value;

  var showUserDetails = true.obs;
}