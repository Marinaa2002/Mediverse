import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';

import '../../../../../../Constants/constant.dart';


class  TextFormFieldPassWidget extends StatefulWidget {
  String? text;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  TextFormFieldPassWidget({Key? key, required this.text,
    required this.validator,
    required this.onChanged
  }) : super(key: key);

  @override
  _CustomTextFormField3State createState() => _CustomTextFormField3State();
}

class _CustomTextFormField3State extends State<TextFormFieldPassWidget> {
  bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      child: TextFormField(
          validator: widget.validator,
          onChanged: widget.onChanged,
          controller: _controller,
          autofocus: false,
          autofillHints: const [AutofillHints.email],
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.text,
            suffixIcon: IconButton(
              icon:
              Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
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
                color: grey,
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
          style: Themes.bodyMed),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
