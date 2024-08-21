import 'dart:ffi';
import 'dart:ffi';

import 'package:flutter/material.dart';

class CustemText extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;

  const CustemText({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(137, 31, 31, 31)),
        ),
        SizedBox(height: 5.0),
        TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter $labelText', // Fixed hint text string
            filled: true,
            // fillColor: const Color(0xFAFAFA),
            fillColor: Color.fromARGB(24, 179, 179, 179),

            // Fill color
            hintStyle: TextStyle(
              color: Color.fromARGB(109, 147, 147, 147), // Hint text color
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0xFFFAFAFA), // Border color
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xFFFAFAFA), // Enabled border color
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xFFFAFAFA), // Focused border color
              ),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // Text color
          ),
        ),
      ],
    );
  }
}
