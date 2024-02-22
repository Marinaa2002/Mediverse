import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Widgets/StartingCont.dart';
import '../../../Widgets/CustomPatientSignUp.dart';


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
