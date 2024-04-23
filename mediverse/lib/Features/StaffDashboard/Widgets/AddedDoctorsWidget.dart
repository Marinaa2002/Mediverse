import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/doctor.dart';
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
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('info_Doctors')
                .where('Hospital', isEqualTo: widget.staffModel.orgName)
                .where('Condition', isEqualTo: "Approved")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                log('${snapshot.error}');
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: const CircularProgressIndicator());
              }
              var doctorsApproved = snapshot.data?.docs
                  .map((doc) =>
                      Doctor.fromJson(doc.data() as Map<String, dynamic>, doc.id))
                  .toList();
              if (doctorsApproved!.isEmpty) {
                return Center(
                  child: Text("No Doctors Added"),
                );
              }
              return ListView.builder(
                itemCount: doctorsApproved.length,
                itemBuilder: (context, i) {
                  return MedicalCard(
                    name: doctorsApproved[i].name!,
                    profile_Picture: doctorsApproved[i].profilePicture!,
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
