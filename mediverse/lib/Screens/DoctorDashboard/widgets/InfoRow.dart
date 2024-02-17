import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constants.dart';

class InfoRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Text(
              'Patient Weight :',
              style: Themes.bodyLarge.copyWith(
                decoration: TextDecoration.underline
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(48, 0, 0, 0),
            child: Container(
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                color: kSecondryBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Color(0x33000000),
                    offset: Offset(2, 2),
                    spreadRadius: 5,
                  )
                ],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    '70 Kg',
                    style: Themes.bodyLarge,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
