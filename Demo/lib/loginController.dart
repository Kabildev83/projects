import 'homecontroller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'home.dart';

class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var rememberMe = true.obs;
  var obscureText = true.obs;
  var showProgress = false.obs;

  void handleLogin() {
    showProgress.value = true;
    Future.delayed(Duration(seconds: 3), () {
      final email = RxString(emailController.text);
      final password = RxString(passwordController.text);

      if (formKey.currentState!.validate()) {
        if (!isValidEmail(email.value)) {
          Get.snackbar('Error', 'Invalid email format');
        } else if (!isValidPassword(password.value)) {
          Get.snackbar('Error', 'Invalid password format');
        } else if (email.value != 'kabildev@otech.com' || password.value != 'DEfault123##') {
          Get.snackbar('Error', 'Incorrect email or password',
              colorText: Colors.white,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.add_alert),
          snackPosition:SnackPosition.BOTTOM
          );
        } else {
          Get.snackbar('Success', 'Login success',
              colorText: Colors.white,
              backgroundColor: Colors.green,
          );
          saveRememberMeState();
          Get.lazyPut<HomeController>(() => HomeController());
          Get.off(() => Home());
          _clearFieldsIfNeeded();
        }
      } else{
        Get.snackbar('Error','Enter both email and password',
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.add_alert),
            snackPosition:SnackPosition.BOTTOM);
      }
      showProgress.value = false;
    });
  }

   _clearFieldsIfNeeded() {
     if (!rememberMe.value) {
       emailController.clear();
       passwordController.clear();
     }
  }

  @override
  onInit() async {
    super.onInit();
    ever(rememberMe, (_) {
      _clearFieldsIfNeeded();
    });
    await _loadRememberMeState();
  }

      @override
      void onClose() {
        emailController.dispose();
        passwordController.dispose();
        super.onClose();
      }

      void togglePasswordVisibility() {
        obscureText.value = !obscureText.value;
        update();
      }

      bool isValidEmail(String? email) {
        if (email == null || email.isEmpty) {
          return false;
        }
        final emailRegExp = RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
        return emailRegExp.hasMatch(email);
      }

  bool isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return false;
    }
    final passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
    return passwordRegExp.hasMatch(password);
  }
  Future<void> saveRememberMeState() async{
    final box =GetStorage();
    await box.write('rememberMe', rememberMe.value);
    if(!rememberMe.value){
      await box.remove('email');
      await box.remove('password');
    }else{
      await box.write('email', emailController.text);
      await box.write('password', passwordController.text);
    }
  }

  Future<void> _loadRememberMeState() async{
    final box = GetStorage();
    rememberMe.value=box.read('rememberMe')??true;
    if(rememberMe.value){
      emailController.text=box.read('email')??'';
      passwordController.text = box.read('password') ?? '';
    }
  }
  }