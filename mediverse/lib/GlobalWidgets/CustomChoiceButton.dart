import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

class ChoiceButton extends StatelessWidget {
  final text;
  final screen;
  const ChoiceButton({
    super.key,
    required this.text,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => screen));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
              primaryColor, // Assuming text color should be white
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
            child: Container(
              width: size.width*0.6,
              height: size.height*.085,
              child: Center(
                child: Text(text, style: Themes.labelMed),
              ),
            ),
          )),
    );
  }
}


