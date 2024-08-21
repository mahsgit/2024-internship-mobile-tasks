import 'package:flutter/material.dart';

class CustemText extends StatelessWidget {
  final String labelText; // Label text above the TextField
  final TextEditingController
      controller; // Controller for managing TextField input

  const CustemText({
    Key? key,
    required this.labelText,
    required this.controller,
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
              color: Color.fromARGB(108, 43, 43, 43)),
        ),
        SizedBox(height: 8.0),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter $labelText', // Fixed hint text string
            filled: true,
            fillColor: Color.fromARGB(255, 237, 237, 237),
            hintStyle: TextStyle(
              color: Color.fromARGB(109, 147, 147, 147), // Hint text color
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: BorderSide(
                color: Color(0xFFFAFAFA), // Border color
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: BorderSide(
                color: Color(0xFFFAFAFA), // Enabled border color
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
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
