import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:mediverse/conts/Themes.dart';
import '../../../Widgets/CustomSignUpLogin.dart';
import '../../../Widgets/CustomSignUpWith.dart';
import '../../../Widgets/CustomTextFormField.dart';
import '../../../Widgets/CustomTextFormField2.dart';
import '../../../Widgets/CustomTextFormField3.dart';
import '../../../conts/consts.dart';

class PatientSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                end: AlignmentDirectional(1, 0),
              ),
            ),
            child: Container(
              width: 100,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    M.cyan,
                    M.white
                  ],
                  stops: [0, 0.4],
                  begin: AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
              ),
            ),
          ),
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
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xCCFFFFFF),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/logo2.png',
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Text(
                              'Patient Sign Up',
                              style:Themes.headline
                            ),
                          ),
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
                  child:  ElevatedButton(
                    onPressed: () async {

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/icons/google.png",
                          width: 23,
                          height: 23,
                        ),
                        SizedBox(width: 8),
                        Text(
                            'Continue with Google',
                            style:Themes.textSmall
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

