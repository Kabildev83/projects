import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? togglePasswordVisibility;

  CustomTextField({
    required this.name,
    required this.controller,
    required this.isPassword,
    required this.obscureText,
    this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $name';
          }
          return null;
        },
        obscureText: isPassword && obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(13.0),
          border: const OutlineInputBorder(),
          labelText: '$name',
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: togglePasswordVisibility,
          )
              : null,
        ),
      ),
    );
  }
}
