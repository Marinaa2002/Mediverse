import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileInfoWidget.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileSettingsWidget.dart';

import '../../../Widgets/PictureProfileWidget.dart';

class PatientProfileScreen extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;
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
          onPressed: () {
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("info_Patients").doc(currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            final userData = snapshot.data!.data() as Map <String, dynamic>;
            return Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const PictureProfileWidget(),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                    child: Text(
                      userData['Name'],
                      textAlign: TextAlign.center,
                      style: Themes.headlineSmall.copyWith(
                        fontFamily: 'Outfit',
                        color: kprimaryTextColor,
                      ),
                    ),
                  ),
                  Text(
                    userData['Email'],
                    style: Themes.titleSmall.copyWith(
                      fontFamily: 'Outfit',
                      color: kprimaryTextColor,
                    ),
                  ),
                  const ProfileInfoWidget(),
                  ProfileSettingsWidget(userData: userData,),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}