import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '../../../Widgets/CustomSignUpLogin.dart';
import '../../../Widgets/CustomTextFormField.dart';
import '../../../Widgets/CustomTextFormField3.dart';
import '../../../conts/consts.dart';
import '../RegisterChoice/RegisterChoiceScreen.dart';

class LoginScreen extends StatelessWidget {
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
                    Color(0x00FFFFFF),
                    FlutterFlowTheme.of(context).secondaryBackground,
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
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
                      'Login',
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF101213),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Text(
                        'Welcome Back',
                        style: FlutterFlowTheme.of(context).displaySmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 40, 0, 20),
                      child: Text(
                        'Please Enter Your Email and Password',
                        style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                    child: CustomTextFormField(text: "Email",),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: CustomTextFormField3(text: "Password",),
                  ),
                  CustomSignUpLogin(text: "Login", screen: null,),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
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
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: ' Sign Up here',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w600,
                              ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RegisterChoice(), // Navigate to your signup screen
                                  ),
                                );
                              },
                            ),
                          ],
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                  )


                ],
              )
          ),
        ],
      ),
    );
  }
}

// child: Column(
//   children: [
//     Row(
//       children: [
//         SizedBox(width: 118,),
//         Padding(
//           padding: EdgeInsets.all(30),
//           child: Column(
//             children: [
//               SizedBox(height: 70,),
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   color: Color(0xCCFFFFFF),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     'assets/images/logo2.png',
//                     width: 300,
//                     height: 200,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
//                 child:
//                 Column(
//                   children: [
//                     Text( 'Login',
//                       style: FlutterFlowTheme.of(context).headlineSmall.override(
//                         fontFamily: 'Plus Jakarta Sans',
//                         color: Color(0xFF101213),
//                         fontSize: 23,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 )
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     Align(
//       alignment: AlignmentDirectional(0, 0),
//       child: Padding(
//         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//         child: Text(
//           'Welcome Back',
//           style: FlutterFlowTheme.of(context).displaySmall,
//         ),
//       ),
//     )
//   ],
// ),