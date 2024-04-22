import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Constants/Themes.dart';

class MedicalInfoRowData extends StatelessWidget {
  MedicalInfoRowData({super.key, required this.text, required this.value});

  String text, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
            child: Text(
              '$text',
              style: Themes.labelLarge18.copyWith(
                fontFamily: 'Readex Pro',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: kSecondryBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Color(0x33000000),
                      offset: Offset(2, 2),
                      spreadRadius: 5,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      '$value',
                      style: Themes.textSmall,
                    ),
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