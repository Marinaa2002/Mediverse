import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../Constants/Themes.dart';
import '../../../../../../Constants/constant.dart';

class TextFormFieldWidget extends StatelessWidget {
  String? text;
  TextFormFieldWidget({
    super.key,
    required this.text,
    required this.validator,
    required this.onChanged,
    required this.controller
  });
  String? Function(String?)? validator;
  Function(String)? onChanged;
  TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      width: size.width*0.95,
      child: TextFormField(
        validator: validator,
          onChanged: onChanged,
        controller: controller,
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
