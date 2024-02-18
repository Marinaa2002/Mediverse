import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import '../conts/consts.dart';

class CustomTextFormField extends StatelessWidget {
  final text;
  const CustomTextFormField({
    super.key,required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:390,
      child:
      TextFormField(
        //     controller: _model.emailAddressController,
        //     focusNode: _model.emailAddressFocusNode,
        autofocus: false,
        autofillHints: [AutofillHints.email],
        obscureText: false,
        decoration: InputDecoration(
          hintText: text,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Plus Jakarta Sans',
            color: M.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFE0E3E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: M.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: M.errorColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: M.errorColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(16),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
          fontFamily: 'Plus Jakarta Sans',
          color: Color(0xFF101213),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        //   keyboardType: TextInputType.emailAddress,
        // validator: _model.emailAddressControllerValidator.asValidator(context),
      ),
    );
  }
}
