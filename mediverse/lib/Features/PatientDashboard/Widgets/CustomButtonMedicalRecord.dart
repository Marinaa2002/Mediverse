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
    return
      Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            MediaQuery.sizeOf(context).width * 0.42,
            37,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding:
          const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          backgroundColor: kprimaryColor,
          textStyle: Themes.bodyXLarge.copyWith(
            color: backgroundColor,
          ),
          elevation: 3,
        ),
        child: Text('$text', style: TextStyle(color: Colors.white
        ),),
      ),
    );
  }
}
