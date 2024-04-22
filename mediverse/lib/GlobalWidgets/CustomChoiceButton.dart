import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

class ChoiceButton extends StatelessWidget {
  final text;
  final String screen;
  const ChoiceButton({
    super.key,
    required this.text,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, screen);
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
              width: 250,
              height: 70,
              child: Center(
                child: Text(text, style: Themes.labelMed),
              ),
            ),
          )),
    );
  }
}
