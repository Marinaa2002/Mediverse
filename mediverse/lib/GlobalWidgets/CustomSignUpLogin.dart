import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import '../Constants/constant.dart';

class CustomSignUpLogin extends StatelessWidget {
  final text;
  VoidCallback? onTap;

  CustomSignUpLogin({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: ElevatedButton(
          onPressed: onTap,
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
            width: screenSize.width * 0.6,
            height: 52,
            child: Center(
              child: Text(
                text,
                style: Themes.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
