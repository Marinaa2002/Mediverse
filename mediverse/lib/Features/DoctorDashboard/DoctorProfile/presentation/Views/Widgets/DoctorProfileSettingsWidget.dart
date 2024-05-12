import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../Constants/Themes.dart';
import '../../../../../../Constants/constant.dart';
import '../../../../../Beginning/LoginScreen/presentation/views/LoginScreen.dart';

class DoctorProfileSettingsWidget extends StatelessWidget {
  var userData;

  DoctorProfileSettingsWidget({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: const BoxDecoration(
          color: kSecondryBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x33000000),
              offset: Offset(0, -1),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Text(
                        'Settings',
                        style: Themes.headlineSmall.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                            child: Icon(
                              Icons.numbers,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Text(
                                'Age',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            userData['Age'],
                            textAlign: TextAlign.center,
                            style: Themes.bodyXLarge.copyWith(
                              fontFamily: 'Readex Pro',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                            child: Icon(
                              Icons.work_outline,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 12, 0),
                              child: Text(
                                'Phone Number',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            userData['Phone'],
                            textAlign: TextAlign.center,
                            style: Themes.bodyXLarge.copyWith(
                              fontFamily: 'Readex Pro',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                            child: Icon(
                              Icons.local_hospital,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 12, 0),
                              child: Text(
                                'Speciality',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            userData['Speciality'],
                            textAlign: TextAlign.center,
                            style: Themes.bodyXLarge.copyWith(
                              fontFamily: 'Readex Pro',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                            child: Icon(
                              Icons.perm_identity_rounded,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Text(
                                'National ID',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            userData['NationalId'] ,
                            textAlign: TextAlign.center,
                            style: Themes.bodyXLarge.copyWith(
                              fontFamily: 'Readex Pro',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                            child: Icon(
                              Icons.edit,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 12, 0),
                              child: Text(
                                'Profile Settings',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            'Edit Profile',
                            textAlign: TextAlign.center,
                            style: Themes.bodyXLarge.copyWith(
                              fontFamily: 'Readex Pro',
                              color: kprimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                            child: Icon(
                              Icons.logout_rounded,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 12, 0),
                              child: Text(
                                'Log out of account',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              'Log Out?',
                              textAlign: TextAlign.center,
                              style: Themes.bodyXLarge.copyWith(
                                fontFamily: 'Readex Pro',
                                color: kprimaryColor,
                              ),
                            ),
                            onTap: (){
                              AwesomeDialog(context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                //title: 'Error',
                                title: 'Are you sure you want to Logout?',
                                titleTextStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                                btnOkOnPress: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                },
                                btnCancelOnPress: () {
                                  //Navigator.pop(context);
                                },
                              ).show();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
