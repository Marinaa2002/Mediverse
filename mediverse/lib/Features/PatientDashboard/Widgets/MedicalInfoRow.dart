import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Constants/Themes.dart';

class MedicalInfoRow extends StatelessWidget {
  MedicalInfoRow({super.key, required this.text, required this.value});

  String text, value;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child:
           Center(child: Text(
              '$text',
              style: Themes.labelLarge18.copyWith(
                fontFamily: 'Readex Pro',
              ),
            ),),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(size.width*0.02, 0, size.width*0.02, 0),
              child: Container(
                height: 45,
                width: size.width*0.6,
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: TextFormField(
                    style: Themes.bodysmall,
                    decoration: InputDecoration(
                      border: InputBorder.none,
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
