import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../GlobalWidgets/CustomPatientSignUp.dart';
import '../../../GlobalWidgets/StartingCont.dart';

class PatientSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const startingCont(),
          CustomPatientSignUp(),
        ],
      ),
    );
  }
}
