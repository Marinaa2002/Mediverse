import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

class TextFormFieldDoctors extends StatelessWidget {
  const TextFormFieldDoctors({super.key});

  static final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      style: Themes.bodyMedium.copyWith(fontSize: 15),
      cursorHeight: 20,
      autofocus: true,
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Search ',
        labelStyle: Themes.labelMedium,
        hintStyle: Themes.labelMedium,
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: kprimaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
      ),
    );
  }
}
