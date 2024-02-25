import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/GlobalWidgets/CustomSignUpLogin.dart';
import 'package:mediverse/GlobalWidgets/CustomSignUpWith.dart';
import 'package:mediverse/GlobalWidgets/CustomTextFormField.dart';
import 'package:mediverse/GlobalWidgets/CustomTextFormField2.dart';
import 'package:mediverse/GlobalWidgets/CustomTextFormField3.dart';
import 'package:mediverse/GlobalWidgets/LogoContainer.dart';
import 'package:mediverse/GlobalWidgets/StartingCont.dart';
import 'package:mediverse/GlobalWidgets/googleButton.dart';
import 'package:mediverse/GlobalWidgets/titleText.dart';

class DoctorSignUpScreen extends StatelessWidget {
  const DoctorSignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          startingCont(),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 88,
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          LogoCont(),
                          titleText(text: "Doctor Sign Up"),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(
                    text: "Name",
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField2(
                    text: "Age",
                    icon: Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(
                    text: "National ID",
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField2(
                    text: "Specialty",
                    icon: Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(
                    text: "Hospital Or Clinic Name",
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(
                    text: "License Number",
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(
                    text: "Email",
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: CustomTextFormField3(
                    text: "Password",
                  ),
                ),
                CustomSignUpLogin(
                  text: "Sign Up",
                  screen: null,
                ),
                CustomSignUpWith(),
                googleButton(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
