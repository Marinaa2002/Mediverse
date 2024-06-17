import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Functions.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/StaffDashboard/LabStaffMainScreen/presentation/LabStaffMainScreen.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/DoctorCard.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/SlotsWidget.dart';

import 'HospitalMangmentAddDoctorsBody.dart';

class AddedDoctorsWidget extends StatelessWidget {
  AddedDoctorsWidget({
    super.key,
    required this.widget,
  });
  TextEditingController textEditingController = TextEditingController();

// final String orgName;
// final String orgType;
  final HospitalMangmentAddDoctorsBody widget;
  StaffModel? staff;
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
              staff = StaffModel.fromJson(snapshot.data!.data()!);
              if (staff!.jobs.isEmpty) {
                return Center(
                  child: Text("No Doctors Added"),
                );
              }
              return ListView.builder(
                itemCount: staff!.jobs.length,
                itemBuilder: (context, i) {
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      deleteElemetInArray(
                          'Staff', globalcurrentUserId, 'Jobs', staff!.jobs[i]);
                    },
                    // Background when swiping to delete
                    background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: DoctorCard(
                      id: staff!.jobs[i],
                      orgName: staff!.orgName,
                    ),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0, bottom: 20),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: kprimaryColor,
              child: Icon(
                Icons.add,
                color:Colors.white
              ),
              onPressed: () async {
                final license_Number = await showTextFieldDialog(context,
                    textEditingController: textEditingController,
                    title: "Add Doctor 's License Number",
                    hintText: 'License Number');
                var id = '';
                textEditingController.clear();
                if (license_Number != null) {
                  try {
                    QuerySnapshot snapshot = await FirebaseFirestore.instance
                        .collection('info_Doctors')
                        .where('License_Number', isEqualTo: license_Number)
                        .get();

                    if (snapshot.docs.isNotEmpty) {
                      id = snapshot.docs.first.id;
                    } else {
                      showSnackBar(context,
                          "No Doctor With this license Number"); // Handle case when no document is found
                    }
                    if (id != "") {
                      // Update the array in Firestore using arrayUnion
                      await FirebaseFirestore.instance
                          .collection('Staff')
                          .doc(globalcurrentUserId)
                          .update({
                        'Jobs': FieldValue.arrayUnion([id]),
                      });
                      FirebaseFirestore.instance
                          .collection('info_Doctors')
                          .doc(id)
                          .update({
                        'Condition': 'Approved',
                        'Clinics': FieldValue.arrayUnion([
                          {
                            'cost': 0,
                            'name': staff!.orgName,
                            'type': staff!.orgType,
                          }
                        ]),
                      });
                      print('license Number added to the array successfully');
                    } else {
                      showSnackBar(
                          context, "No Doctor With this license Number");
                    }
                  } catch (error) {
                    print('Error adding license Number to the array: $error');
                  }
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
