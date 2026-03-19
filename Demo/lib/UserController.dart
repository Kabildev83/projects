import 'package:get/get.dart';

class UserController extends GetxController{
  var showUserDetails = true.obs;

  void toggleShowUserDetails(bool value) {
    showUserDetails.value = value;
    update();
  }

}