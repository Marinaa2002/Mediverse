import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import '../../../GlobalWidgets/CustomSignUpLogin.dart';
import '../../../GlobalWidgets/CustomSignUpWith.dart';
import '../../../GlobalWidgets/CustomTextFormField.dart';
import '../../../GlobalWidgets/CustomTextFormField2.dart';
import '../../../GlobalWidgets/CustomTextFormField3.dart';
import '../../../GlobalWidgets/LogoContainer.dart';
import '../../../GlobalWidgets/StartingCont.dart';
import '../../../GlobalWidgets/googleButton.dart';
import '../../../GlobalWidgets/titleText.dart';
import '../RegisterChoice/RegisterChoiceScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const startingCont(),
          SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const LogoCont(),
              const titleText(
                text: "Login",
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text('Welcome Back', style: Themes.bigHeadline),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: const AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 40, 0, 20),
                  child: Text('Please Enter Your Email and Password',
                      style: Themes.titleButton),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                child: CustomTextFormField(
                  text: "Email",
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                child: CustomTextFormField3(
                  text: "Password",
                ),
              ),
              const CustomSignUpLogin(
                text: "Login",
                screen: null,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {},
                  child: RichText(
                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: Themes.verySmallText,
                        ),
                        TextSpan(
                          text: ' Sign Up here',
                          style: Themes.labelColored,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RegisterChoice(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
