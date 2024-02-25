import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'My Profile',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 140,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
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
                            padding: const EdgeInsets.all(2),
                            child: Hero(
                              tag: 'profile',
                              child: Container(
                                width: 50,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
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
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
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
                            padding: const EdgeInsets.all(7),
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
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
              child: Text(
                'Dr. Nader Nabil',
                textAlign: TextAlign.center,
                style: Themes.headlineSmall.copyWith(
                  fontFamily: 'Outfit',
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              'nader.nabil@gmail.com',
              style: Themes.titleSmall.copyWith(
                fontFamily: 'Readex Pro',
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 32),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 12),
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
                                alignment: const AlignmentDirectional(0, 0),
                                child: const Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.black,
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
                              color: Colors.black,
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
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
                              alignment: const AlignmentDirectional(0, 0),
                              child: const Icon(
                                Icons.help_outline_outlined,
                                color: Colors.black,
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
                            color: Colors.black,
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 12),
                              child: Text(
                                'Settings',
                                style: Themes.headlineSmall.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.work_outline,
                                      color: kSecondaryTextColor,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                      child: Text(
                                        'Phone Number',
                                        textAlign: TextAlign.start,
                                        style: Themes.bodyXLarge,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '01009345581',
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.language_rounded,
                                      color: kSecondaryTextColor,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                      child: Text(
                                        'Language',
                                        textAlign: TextAlign.start,
                                        style: Themes.bodyXLarge,
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.local_hospital,
                                      color: kSecondaryTextColor,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                      child: Text(
                                        'Speciality',
                                        textAlign: TextAlign.start,
                                        style: Themes.bodyXLarge,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Pediatrics',
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.money_rounded,
                                      color: kSecondaryTextColor,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.edit,
                                      color: kSecondaryTextColor,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.notifications_active,
                                      color: kSecondaryTextColor,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                      child: Text(
                                        'Notification Settings',
                                        textAlign: TextAlign.start,
                                        style: Themes.bodyXLarge,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right_rounded,
                                    color: kSecondaryTextColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: Icon(
                                      Icons.login_rounded,
                                      color: kSecondaryTextColor,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
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
