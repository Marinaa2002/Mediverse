import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/PatientProfileScreen.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/NetworkImage.dart';
import '../../../Constants/Themes.dart';
import '../HospitalStaffManagementScreenAddDoctors/presentation/Views/HospitalStaffManagementScreenAddDoctors.dart';

class MedicalCard extends StatelessWidget {
  const MedicalCard({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Patient_Profile')
            .doc(id)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SpinKitSpinningCircle(
              color: kprimaryColor,
              size: 50,
            )); // Show a loading indicator while waiting for data
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } //
          PatientProfileModel patientProfileModel =
              PatientProfileModel.fromJson(snapshot.data!.data());
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/LabResultsScreenStaff',
                        arguments: {'id': id});
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: CachedNetworkImage(
                      imageUrl: patientProfileModel.profilePicture,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    patientProfileModel.name,
                    style: Themes.bodyLarge,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: const Color(0xFF57636C),
                    size: 24,
                  ),
                ),
              ),
              Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey[300]), // Add Divider
            ],
          );
        });
  }
}
