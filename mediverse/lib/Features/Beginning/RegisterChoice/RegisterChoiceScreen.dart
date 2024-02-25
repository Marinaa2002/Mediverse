import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/GlobalWidgets/BeginWidget.dart';
import 'package:mediverse/GlobalWidgets/CustomChoiceButton.dart';

import '../FormStaff/FormStaff.dart';
import '../SignUp/presentation/Views/DoctorSignUp.dart';
import '../SignUp/presentation/Views/PatientSignUp.dart';

class RegisterChoice extends StatelessWidget {
  const RegisterChoice({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BeginWidget(
        widget: Column(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/logo2.png',
                width: 400,
                height: 406,
                fit: BoxFit.contain,
                alignment: const Alignment(0, 0),
              ),
            ),
          ),
          ChoiceButton(
            text: 'Patient',
            screen: PatientSignUpScreen(),
          ),
          const ChoiceButton(
            text: 'Doctor',
            screen: DoctorSignUpScreen(),
          ),
          const ChoiceButton(
            text: 'Staff',
            screen: FormStaff(),
          ),
        ]),
      ),
    );
  }
}
