import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/AllModels/requestModel.dart';

import 'package:mediverse/Features/StaffDashboard/Widgets/AdminPageBody.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/DoctorAccountRequestWidgetCompWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/LabRequestAccountCompeleteWidget.dart';

class VerifyAccountWidget extends StatelessWidget {
  const VerifyAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Form_Requests_Info')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> formRequestsSnapshot) {
              if (formRequestsSnapshot.hasError) {
                return Text('Error: ${formRequestsSnapshot.error}');
              }

              if (formRequestsSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              final requests = formRequestsSnapshot.data?.docs
                  .map((doc) =>
                      RequestModel.fromJson(doc.data() as Map<String, dynamic>))
                  .toList();

              return LabRequestAccountCompeleteWidget(
                requestModel: requests![1],
                onPressedAccept: () {},
                onPressedDecline: () {},
              );

              // Process data from 'Form_Requests_Info' collection
              // and build widgets accordingly

              // Example widget
            },
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('info_Doctors')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> doctorsSnapshot) {
              if (doctorsSnapshot.hasError) {
                return Text('Error: ${doctorsSnapshot.error}');
              }

              if (doctorsSnapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              // Process data from 'info_Doctors' collection
              // and build widgets accordingly

              return const DoctorAccountRequestWidgetCompWidget(); // Example widget
            },
          ),

          // Repeat StreamBuilders for any other collections
        ],
      ),
    );
  }
}
