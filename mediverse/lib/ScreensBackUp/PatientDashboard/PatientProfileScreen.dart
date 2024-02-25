import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

import 'Widgets/InfoProfileWidget.dart';
import 'Widgets/PictureProfileWidget.dart';
import 'Widgets/SettingsProfileWidget.dart';

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
            PictureProfileWidget(),
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
              InfoProfileWidget(),
              SettingsProfileWidget(),
            ],
          ),
        ),
    );
  }
}
