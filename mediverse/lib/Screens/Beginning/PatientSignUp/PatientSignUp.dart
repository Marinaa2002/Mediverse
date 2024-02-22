import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Widgets/LogoContainer.dart';
import 'package:mediverse/Widgets/StartingCont.dart';
import 'package:mediverse/Widgets/googleButton.dart';
import '../../../Widgets/CustomSignUpLogin.dart';
import '../../../Widgets/CustomSignUpWith.dart';
import '../../../Widgets/CustomTextFormField.dart';
import '../../../Widgets/CustomTextFormField2.dart';
import '../../../Widgets/CustomTextFormField3.dart';
import '../../../Widgets/titleText.dart';

class PatientSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const startingCont(),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 88,),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          SizedBox(height: 70,),
                          LogoCont(),
                          titleText(text: "Patient Sign Up",),
                          SizedBox(height: 40,),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(text: "Name",),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField2(text: "Age",icon: Icon(Icons.arrow_drop_down_sharp,size: 30,),),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(text: "National ID",),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(text: "Email",),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: CustomTextFormField3(text: "Password",),
                ),
                CustomSignUpLogin(text: "Sign Up", screen:null,),
                CustomSignUpWith(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child:  googleButton(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
