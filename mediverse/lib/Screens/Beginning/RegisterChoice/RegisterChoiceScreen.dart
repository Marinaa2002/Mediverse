import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Widgets/CustomChoiceButton.dart';
import '../../../conts/consts.dart';
import '../DoctorSignUp/DoctorSignUp.dart';
import '../FormStaff/FormStaff.dart';
import '../PatientSignUp/PatientSignUp.dart';


class RegisterChoice extends StatelessWidget{
  const RegisterChoice({super.key});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:
    Center(
      child:
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              M.primaryColor,
              M.errorColor,
              M.tertiary,
            ],
            stops: [0, 0.5, 1],
            begin: AlignmentDirectional(-1, -1),
            end: AlignmentDirectional(1, 1),
          ),
        ),
    child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        M.cyan,
        M.white
      ],
    stops: [0, 1],
    begin: AlignmentDirectional(0, -1),
    end: AlignmentDirectional(0, 1),
    ),
    ),
        child: Column(
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
            ]),
      ),
    ),),
  );
  }
}

