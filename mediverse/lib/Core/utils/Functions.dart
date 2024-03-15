import 'package:flutter/material.dart';

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
        title: Text(title),
        content: Form(
          key: _formKey,
          child: TextFormField(
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
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (!isError) {
                Navigator.of(context).pop(textEditingController.text);
              }
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
