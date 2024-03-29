import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/Beginning/FormStaff/presentation/views/FormStaff.dart';
import 'package:mediverse/Features/Beginning/SignUpDoctor/presentation/view/DoctorSignUp.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/presentation/view/PatientSignUp.dart';
import 'package:mediverse/GlobalWidgets/BeginWidget.dart';
import 'package:mediverse/GlobalWidgets/CustomChoiceButton.dart';

class RegisterChoice extends StatelessWidget {
  const RegisterChoice({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BeginWidget(
        widget: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/logo2.png',
                width: size.width,
                height: size.height*0.5,
                fit: BoxFit.contain,
              ),
            ),
          ),
          ChoiceButton(
            text: 'Patient',
            screen: PatientSignUpScreen(),
          ),
          ChoiceButton(
            text: 'Doctor',
            screen: DoctorSignUpScreen(),
          ),
          ChoiceButton(
            text: 'Staff',
            screen: FormStaff(),
          ),
        ]),
      ),
    );
  }
}
