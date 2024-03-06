import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';

import '../Constants/constant.dart';

class CustomSignUpLogin extends StatelessWidget {
  final text;
  VoidCallback? onTap;
  CustomSignUpLogin({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              //foregroundColor: Colors.white,
              backgroundColor: primaryColor, // Assuming text color should be white
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
            child: SizedBox(
              width: 230,
              height: 52,
              child: Center(
                child: Text(text, style: Themes.titleSmall),
              ),
            ),
          )),
    );
  }
}
