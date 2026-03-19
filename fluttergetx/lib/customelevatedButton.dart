import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView {
  final String buttonName;
  final String routeName;
  final Map<String, dynamic>? arguments;

  CustomButton({
    required this.buttonName,
    required this.routeName,
    this.arguments
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Get.toNamed(routeName,arguments: arguments);
      },
      child: Text(buttonName),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        minimumSize: Size(100, 0),
      ),
    );
  }
}
