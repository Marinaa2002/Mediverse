import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class ChoiceButton extends StatelessWidget {
  final text;
  final screen;
  const ChoiceButton({
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
          },
          text: text,
          options: FFButtonOptions(
            width: 250,
            height: 70,
            padding:
            EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            iconPadding:
            EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context)
                .titleSmall
                .override(
              fontFamily: 'Readex Pro',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            elevation: 3,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}