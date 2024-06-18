import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';

import 'Widgets/LabStaffProfileLoadingIndicatorWidget.dart';
import 'Widgets/LabStaffProfilePictureWidget.dart';
import 'Widgets/LabStaffProfileSettingsWidget.dart';


class LabStaffProfileScreen extends StatelessWidget {
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
        stream: FirebaseFirestore.instance
            .collection("Staff")
            .doc(currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 15,),
                  LabStaffProfilePictureWidget(userData: userData),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 4),
                    child: Text(
                      userData['Org Name'] ?? 'Org Name',
                      textAlign: TextAlign.center,
                      style: Themes.headlineSmall.copyWith(
                        fontFamily: 'Outfit',
                        color: kprimaryTextColor,
                      ),
                    ),
                  ),
                  Text(
                    userData['Email'] ?? 'Email',
                    style: Themes.titleSmall.copyWith(
                        fontFamily: 'Outfit',
                        color: kprimaryTextColor,
                        fontSize: 20),
                  ),
                  SizedBox(height: 20,),
                  LabStaffProfileSettingsWidget(
                    userData: userData,
                  ),
                ],
              ),
            );
          } else {
            return LabStaffProfileLoadingIndicatorWidget();
          }
        },
      ),
    );
  }
}
