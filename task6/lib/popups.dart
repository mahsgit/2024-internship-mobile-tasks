import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupDialog extends StatelessWidget {
  const PopupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Notification'),
      content: Text('abebe messeged you '),
      actions: [
        TextButton(
          onPressed: () {
            // Close the popup
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}

// Showing the popup
void showPopup(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => PopupDialog(),
    ),
  );
}