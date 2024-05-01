import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/DoctorCard.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/PatientCard.dart';

import 'HospitalMangmentAddDoctorsBody.dart';

class AddedDoctorsWidget extends StatelessWidget {
  const AddedDoctorsWidget({
    super.key,
    required this.widget,
  });

  final HospitalMangmentAddDoctorsBody widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Staff')
                .doc(globalcurrentUserId)
                .snapshots(),
            //  FirebaseFirestore.instance.collection('info_Doctors').where(
            //         'clinics',
            //         arrayContains: {'name': widget.staffModel.orgName})
            // .where('Condition', isEqualTo: "Approved")
            // .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                log('${snapshot.error}');
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: const CircularProgressIndicator());
              }
              StaffModel staff = StaffModel.fromJson(snapshot.data!.data()!);
              if (staff!.jobs.isEmpty) {
                return Center(
                  child: Text("No Doctors Added"),
                );
              }
              return ListView.builder(
                itemCount: staff.jobs.length,
                itemBuilder: (context, i) {
                  return DoctorCard(
                    id: staff.jobs[i],
                    orgName: staff.orgName,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
