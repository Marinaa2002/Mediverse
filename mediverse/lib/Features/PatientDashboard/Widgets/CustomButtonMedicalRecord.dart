import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

class CustomButtonMedicalRecord extends StatelessWidget {
  CustomButtonMedicalRecord(
      {super.key, required this.onPressed, required this.text});

  void Function()? onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsetsDirectional.fromSTEB(screenSize.width*0.001, 0, screenSize.width*0.001, 0),
      child: ElevatedButton(
        onPressed: onPressed,
    style: ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    elevation: 3,
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    side: BorderSide(
    color: Colors.transparent,
    width: 1,
       ),
     ),
    ),
    child: Container(
    width: screenSize.width * 0.45,
    height: 45,
    child: Center(
        child: Text('$text', style: TextStyle(color: Colors.white,fontSize:18
        ),
     ),
      ),),)
    );
  }
}
