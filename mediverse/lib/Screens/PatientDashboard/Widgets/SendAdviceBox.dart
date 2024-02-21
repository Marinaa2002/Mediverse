import 'package:flutter/material.dart';

import '../../../Constants/constant.dart';

class SendAdviceBox extends StatelessWidget {
  const SendAdviceBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 1),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: kprimaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Send Advice',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(
                          12, 0, 8, 0),
                    ),
                    style: TextStyle( color: Colors.white,
                      fontSize: 12,),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1, 0),
                child: Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
