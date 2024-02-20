import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

class PatientProfileScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: kSecondryBackgroundColor,
            size: 24,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'My Profile',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 140,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kprimaryColor,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/Human.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: ClipOval(
                        child: Container(
                          width: 43,
                          height: 43,
                          decoration: BoxDecoration(
                            color: kSecondryBackgroundColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kprimaryColor,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(7),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.asset(
                                  'assets/images/draw.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                child: Text(
                  'Dr. David Parker',
                  textAlign: TextAlign.center,
                  style: Themes.headlineSmall.copyWith(
                    fontFamily: 'Outfit',
                    color: kprimaryTextColor,
                  ),
                ),
              ),
              Text(
                'David.parker@gmail.com',
                style: Themes.titleSmall.copyWith(
                  fontFamily: 'Outfit',
                  color: kprimaryTextColor,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 32),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: kSecondryBackgroundColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: kprimaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Icon(
                                    Icons.notifications_outlined,
                                    color: kprimaryTextColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              ' Notifications',
                              textAlign: TextAlign.center,
                              style: Themes.titleSmall.copyWith(
                                fontFamily: 'Readex Pro',
                                color: kprimaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3,
                              shape: const CircleBorder(),
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: kSecondryBackgroundColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: kprimaryColor,
                                    width: 2,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Icon(
                                  Icons.help_outline_outlined,
                                  color: kprimaryTextColor,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Help Center',
                            textAlign: TextAlign.center,
                            style: Themes.titleSmall.copyWith(
                              fontFamily: 'Readex Pro',
                              color: kprimaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
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
              ),
            ],
          ),
        ),
    );
  }
}