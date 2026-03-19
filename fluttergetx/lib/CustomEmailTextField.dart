import 'package:flutter/material.dart';
import 'package:fluttergetx/customTextController.dart';
import 'package:get/get.dart';

class CustomTextField extends GetView<CustomTextController>{
  final String labelText;
  final bool isPassword;

  CustomTextField({
    required this.labelText,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<CustomTextController>(
        init: CustomTextController(),
        builder: (controller) {
          // Ensure that controller is not null before using it
          if (controller == null) {
            // Handle the case where the controller is null
            return SizedBox.shrink(); // or return an appropriate widget
          }

          return TextFormField(
            onChanged: (value) {
              if (isPassword) {
                controller.setPassword(value);
              } else {
                controller.setEmail(value);
              }
            },
            obscureText: isPassword && !controller.isPasswordVisible.value,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(13.0),
              border: const OutlineInputBorder(),
              labelText: labelText,
              suffixIcon: isPassword
                  ? IconButton(
                icon: Icon(
                  controller.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: controller.togglePasswordVisibility,
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
