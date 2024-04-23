import 'package:flutter/material.dart';
import '../../../Constants/constant.dart';

class CustomEditConfirm extends StatelessWidget {
  CustomEditConfirm(
      {super.key, this.onPressed, required this.text});

  void Function()? onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Padding(
        padding:  EdgeInsetsDirectional.fromSTEB(screenSize.width*0.001, 0, screenSize.width*0.001, 0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            elevation: MaterialStateProperty.all<double>(3),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: primaryColor,
                  width: 1,
                ),
              ),
            ),
          ),
          child: Container(
            width: screenSize.width * 0.45,
            height: 45,
            child: Center(
              child: Text(
                '$text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        )

    );
  }
}
