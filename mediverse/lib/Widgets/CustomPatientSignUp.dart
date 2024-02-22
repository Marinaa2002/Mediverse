import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Widgets/titleText.dart';
import 'CustomSignUpLogin.dart';
import 'CustomSignUpWith.dart';
import 'CustomTextFormField.dart';
import 'CustomTextFormField2.dart';
import 'CustomTextFormField3.dart';
import 'LogoContainer.dart';
import 'googleButton.dart';

class CustomPatientSignUp extends StatelessWidget {
  const CustomPatientSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
