import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final IconData prefixIconData;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  final bool obscureText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.prefixIconData,
    this.suffixIcon,
    required this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefix: Icon(prefixIconData),
          suffix: suffixIcon),
    );
  }
}
