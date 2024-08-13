import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final TextEditingController controller;
  final String? labelText;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
    this.labelText,
    this.suffixIcon,
    this.backgroundColor = const Color.fromARGB(255, 228, 228, 228),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none, // Remove border color
          ),
          suffixIcon: suffixIcon, // Add suffix icon
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );
  }
}
