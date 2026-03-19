import 'package:get/get.dart';

class CustomTextController extends GetxController{
  RxString email =''.obs;
  RxString password =''.obs;
  RxBool isPasswordVisible =false.obs;

  void setEmail(String value){
    email.value=value;
  }
  void setPassword(String value){
    password.value=value;
  }

  void togglePasswordVisibility(){
    isPasswordVisible.value=!isPasswordVisible.value;
  }
}

