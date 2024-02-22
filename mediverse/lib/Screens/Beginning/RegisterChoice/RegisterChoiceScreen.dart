import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Widgets/BeginWidget.dart';
import '../../../Widgets/CustomChoiceButton.dart';
import '../DoctorSignUp/DoctorSignUp.dart';
import '../FormStaff/FormStaff.dart';
import '../PatientSignUp/PatientSignUp.dart';


class RegisterChoice extends StatelessWidget{
  const RegisterChoice({super.key});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:
    BeginWidget(widget: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/logo2.png',
                width: 400,
                height: 406,
                fit: BoxFit.contain,
                alignment: Alignment(0, 0),
              ),
            ),
          ),
          ChoiceButton(text: 'Patient', screen: PatientSignUpScreen(),),
          ChoiceButton(text: 'Doctor', screen: DoctorSignUpScreen(),),
          ChoiceButton(text: 'Staff', screen: FormStaff(),),
        ]),),
  );
  }
}

