import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/Themes.dart';
import '../Constants/constant.dart';

class CustomTextFormField extends StatelessWidget {
  var TextEditingController;
  final text;
  CustomTextFormField({
    super.key,
    required this.text, this.TextEditingController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      child: TextFormField(
          validator: (data) {
            if (data!.isEmpty) {
              return 'field is required';
            }
            if(text=="Email"){
              if (!data.contains('@')) {
                return 'Formatted Email is required';
              }
            }
            if (text == "Age") {
              if (data.length > 2 || int.tryParse(data) == null) {
                return 'Valid age is required ';
            }
            }
          },
          controller: TextEditingController,
          autofocus: false,
          autofillHints: [AutofillHints.email],
          obscureText: false,
          decoration: InputDecoration(
            hintText: text,
            labelStyle: Themes.fieldText,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE0E3E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: errorColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: errorColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
          ),
          style: Themes.bodyMed
          ),
    );
  }
}
