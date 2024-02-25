import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/GlobalWidgets/CustomPatientSignUp.dart';
import 'package:mediverse/GlobalWidgets/StartingCont.dart';

class PatientSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          startingCont(),
          CustomPatientSignUp(),
        ],
      ),
    );
  }
}
