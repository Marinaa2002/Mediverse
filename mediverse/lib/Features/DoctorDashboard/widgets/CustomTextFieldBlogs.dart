import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

class TextFieldBlogs extends StatelessWidget{
  final String text;
  var TextEditingController;

  TextFieldBlogs({
    required this.text,
    required this.TextEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController,
      autofocus: true,
      obscureText: false,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: Themes.bodysmall.copyWith(
          fontWeight: FontWeight.normal,
          color: kSecondaryTextColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE0E3E7),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kprimaryColor,
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
      style: Themes.bodysmall.copyWith(
        fontWeight: FontWeight.normal,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      maxLines: null,
      minLines: 1,
    );
  }
}
