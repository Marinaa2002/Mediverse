import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Widgets/LogoContainer.dart';
import 'package:mediverse/Widgets/StartingCont.dart';
import '../../../Widgets/CustomAlignText.dart';
import '../../../Widgets/CustomSignUpLogin.dart';
import '../../../Widgets/CustomTextFormField.dart';
import '../../../Widgets/CustomTextFormField2.dart';
import '../../../Widgets/titleText.dart';

class FormStaff extends StatelessWidget {
  const FormStaff({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          startingCont(),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 74,),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          SizedBox(height: 70,),
                          LogoCont(),
                          titleText(text: "Form Staff Request"),
                          SizedBox(height: 40,),
                        ],
                      ),
                    ),
                  ],
                ),
                AlignText(text: "Choose Type Of Staff",),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField2(text: "Please select...",icon: Icon(Icons.arrow_drop_down_sharp,size: 30,),),
                ),
                AlignText(text: "Please Enter Required Data"),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(text: "Organization Name",),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField2(text: "Organization Type",icon: Icon(Icons.arrow_drop_down_sharp,size: 30,),),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(text: "License Number",),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(text: "Detailed Location",),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: CustomTextFormField(text: "Email",),
                ),
                CustomSignUpLogin(text: "Request", screen: null,),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


