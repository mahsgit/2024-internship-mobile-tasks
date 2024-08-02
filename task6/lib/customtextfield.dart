import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final EdgeInsetsGeometry? padding;
  final double width;
  final double height;
  final Color fillColor;
  final Color borderColor; // Add borderColor property

  CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.padding,
    this.width = 300.0,
    this.height = 45.0,
    this.fillColor = Colors.white,
    this.borderColor = Colors.black, // Default border color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(4.0),
      child: Container(
        width: width,
        height: height,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(color: borderColor), // Change label color
            suffixIcon: suffixIcon,
            fillColor: fillColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              borderSide: BorderSide(color: borderColor), // Border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: borderColor), // Border color for enabled state
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: borderColor), // Border color for focused state
            ),
          ),
        ),
      ),
    );
  }
}
