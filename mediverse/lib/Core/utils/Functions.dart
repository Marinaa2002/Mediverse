import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

bool isNum(value) {
  final RegExp numberRegex = RegExp(r'^[0-9]+$');
  if (!numberRegex.hasMatch(value)) {
    return false;
  }
  return true;
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
Future<String?> showTextFieldDialog(BuildContext context,
    {textEditingController, title, hintText}) {
  bool isError = false;
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        content: Form(
          key: _formKey,
          child: TextFormField(
            style: const TextStyle(color: Colors.black),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Number';
              }
              if (!isNum(value)) {
                isError = true;
                return 'Please enter Numbers only';
              }
              // Use a regular expression to check if the input contains only numbers

              return null;
            }, // Return null if the input is valid,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            autofocus: true,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimaryColor, // Set the background color
            ),
            onPressed: () {
              Navigator.of(context).pop(textEditingController.text);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

void popUntilRoute(BuildContext context, String targetRouteName) {
  Navigator.of(context).popUntil((route) {
    // Check if the route's settings name matches the target route name
    return route.settings.name == targetRouteName;
  });
}
