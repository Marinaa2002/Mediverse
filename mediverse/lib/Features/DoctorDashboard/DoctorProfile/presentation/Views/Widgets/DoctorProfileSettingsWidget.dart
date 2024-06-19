import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../Constants/Themes.dart';
import '../../../../../../Constants/constant.dart';
import '../../../../../Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'DoctorProfileEditWidget.dart';

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
                            userData['Age'] ?? 'Age',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
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
                            userData['Phone'] ?? 'Phone Number',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
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
                            userData['Speciality'] ?? 'Speciality',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
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
                            userData['NationalId'] ?? 'NationalId',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
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
                              Icons.data_thresholding_rounded,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Text(
                                'License Number',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            userData['License_Number'] ?? 'License Number',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
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
                              Icons.money_rounded,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Text(
                                'Currency',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            'Egyptian Pound',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
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
                              Icons.language,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Text(
                                'Language',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            'English(eng)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
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
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      DoctorProfileEditWidget(
                                        userData: userData,
                                      ),));
                            },
                            child: Text(
                              'Edit Profile',
                              textAlign: TextAlign.center,
                              style: Themes.bodyXLarge.copyWith(
                                fontFamily: 'Readex Pro',
                                color: kprimaryColor,
                              ),
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
                              // AwesomeDialog(
                              //   context: context,
                              //   dialogType: DialogType.warning,
                              //   dialogBackgroundColor: Colors.white,
                              //   animType: AnimType.rightSlide,
                              //   title: 'Are you sure you want to Logout?',
                              //   titleTextStyle: TextStyle(
                              //     fontSize: 14,
                              //     fontWeight: FontWeight.bold,
                              //     color: Colors.black,
                              //   ),
                              //   // customHeader: Container(
                              //   //   decoration: BoxDecoration(
                              //   //     shape: BoxShape.circle,
                              //   //     color:kprimaryColor,
                              //   //     boxShadow: [
                              //   //       BoxShadow(
                              //   //         color: Colors.indigo.withOpacity(0.5),
                              //   //         spreadRadius: 5,
                              //   //         blurRadius: 5,
                              //   //         offset: Offset(0, 3),
                              //   //       ),
                              //   //     ],
                              //   //   ),
                              //   //   child: Center(
                              //   //     child: Icon(
                              //   //       Icons.warning_amber_rounded,
                              //   //       size: 50,
                              //   //       color: Colors.white,
                              //   //     ),
                              //   //   ),
                              //   // ),
                              //   btnOk: ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //      // backgroundColor: kprimaryColor,
                              //     ),
                              //     onPressed: () {
                              //       Navigator.pop(context);
                              //       Navigator.pop(context);
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) => LoginScreen(),
                              //         ),
                              //       );
                              //     },
                              //     child: Text(
                              //       'OK',
                              //       style: TextStyle(color: Colors.black),
                              //     ),
                              //   ),
                              //   btnCancel:
                              //   ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor: Colors.white,
                              //     ),
                              //     onPressed: () {
                              //       Navigator.pop(context);
                              //     },
                              //     child: Text(
                              //       'Cancel',
                              //       style: TextStyle(color: Colors.black),
                              //     ),
                              //   ),
                              // ).show();
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.noHeader,
                                dialogBackgroundColor: Colors.white,
                                animType: AnimType.rightSlide,
                                title: 'Are you sure you want to Logout?',
                                titleTextStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: kprimaryColor,
                                ),
                                customHeader: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:kprimaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.indigo.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.warning_amber_rounded,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                btnOk: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kprimaryColor,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                btnCancel:
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: kprimaryColor),
                                  ),
                                ),
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
