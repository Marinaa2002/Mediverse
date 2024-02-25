import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

class SettingsProfileWidget extends StatelessWidget {
  const SettingsProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
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
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Text(
                        'Settings',
                        style: Themes.headlineSmall.copyWith(
                          color: kprimaryTextColor,
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
                              Icons.work_outline,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Text(
                                'Phone Number',
                                textAlign: TextAlign.start,
                                style:Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            '01203456232',
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                            child: Icon(
                              Icons.language_rounded,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Text(
                                'Language',
                                textAlign: TextAlign.start,
                                style:Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            'English (eng)',
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
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
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
                            style: Themes.bodyXLarge.copyWith(
                              fontFamily: 'Readex Pro',
                              color: kprimaryColor,
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
                              Icons.edit,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                            child: Icon(
                              Icons.notifications_active,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Text(
                                'Notification Settings',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: kSecondaryTextColor,
                            size: 24,
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
                              Icons.login_rounded,
                              color: kSecondaryTextColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Text(
                                'Log out of account',
                                textAlign: TextAlign.start,
                                style: Themes.bodyXLarge,
                              ),
                            ),
                          ),
                          Text(
                            'Log Out?',
                            textAlign: TextAlign.center,
                            style: Themes.bodyXLarge.copyWith(
                              fontFamily: 'Readex Pro',
                              color: kprimaryColor,
                            ),
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
