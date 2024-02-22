import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../conts/Themes.dart';
import '../conts/consts.dart';

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
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: M.primaryColor, // Assuming text color should be white
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Container(
            width: 250,
            height: 70,
            child: Center(
              child: Text(
                text,
                style: Themes.labelMed
              ),
            ),
          ),
        )
      ),
    );
  }
}