import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import '../conts/consts.dart';

class CustomSignUpLogin extends StatelessWidget {
  final text;
  final screen;
  const CustomSignUpLogin({
    super.key, required this.text,required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
        child: FFButtonWidget(
          onPressed: () {
           // Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
          },
          text: text,
          options: FFButtonOptions(
            width: 230,
            height: 52,
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: M.primaryColor,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Plus Jakarta Sans',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            elevation: 3,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}