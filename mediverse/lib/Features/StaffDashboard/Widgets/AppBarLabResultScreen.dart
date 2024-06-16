import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';

import '../../../Constants/Themes.dart';

class AppBarLabResultScreen extends StatelessWidget {
  const AppBarLabResultScreen({super.key, this.lab_name = 'Lab Page'});
  final String lab_name;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Staff')
            .doc(globalcurrentUserId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), // Show a loading indicator
            );
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
              child: Text('No LabStaff available'),
            );
          }
          StaffModel staffModel = StaffModel.fromJson(snapshot.data!.data());
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    staffModel.orgName,
                    style: Themes.headlineSmall,
                  ),
                ),
              ),
              GestureDetector(
                child: Icon(color: Colors.white, Icons.logout),
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    //title: 'Error',
                    title: 'Are you sure you want to Logout?',
                    titleTextStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    btnOkOnPress: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    btnCancelOnPress: () {
                      //Navigator.pop(context);
                    },
                  ).show();
                },
              ),
            ],
          );
        });
  }
}
