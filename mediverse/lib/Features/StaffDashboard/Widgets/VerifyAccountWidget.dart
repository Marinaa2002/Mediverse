import 'dart:developer';

import 'package:emailjs/emailjs.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/AllModels/requestModel.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Email_service.dart';

import 'package:mediverse/Features/StaffDashboard/Widgets/LabRequestAccountCompeleteWidget.dart';

class VerifyAccountWidget extends StatelessWidget {
  const VerifyAccountWidget({
    super.key,
  });

  void fillCollection() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // List to store the created dummy requests
    List<RequestModel> requests = [];

    // Create dummy variables with status set to "pending"
    for (int i = 0; i < 2; i++) {
      if (i % 2 == 0) {
        requests.add(RequestModel(
          email: 'email$i@example.com',
          name: "Philo",
          licenseNumber: 'License $i',
          location: 'Location $i',
          orgName: 'Organization $i',
          orgType: 'Org Type $i',
          staff: 'Staff $i',
          status: 'pending',
        ));
      } else {
        requests.add(RequestModel(
          email: 'email$i@example.com',
          name: "Philo",
          licenseNumber: 'License $i',
          location: 'Location $i',
          orgName: 'Organization $i',
          orgType: 'Org Type $i',
          staff: 'Doctor',
          status: 'pending',
        ));
      }
    }

    // Add each request to the Firestore collection
    for (var request in requests) {
      firestore.collection('Form_Requests_Info').add({
        'Email': request.email,
        'Name': request.name,
        'License_Number': request.licenseNumber,
        'Location': request.location,
        'Org Name': request.orgName,
        'Org Type': request.orgType,
        'Staff': request.staff,
        'Status': request.status,
      }).then((value) {
        print('Request added with ID: ${value.id}');
      }).catchError((error) {
        print('Failed to add request: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    fillCollection();
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Form_Requests_Info')
              .where('Status', isEqualTo: 'pending')
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

            return Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: requests?.length,
                itemBuilder: (context, i) {
                  return LabRequestAccountCompeleteWidget(
                    requestModel: requests![i],
                    onPressedAccept: () async {
                      String requestId = formRequestsSnapshot.data!.docs[i].id;
                      CollectionReference metaData =
                          FirebaseFirestore.instance.collection('MetaData');
                      if (requests[i].staff == "Doctor") {
                        // Update the status of the request to "Accepted"
                        FirebaseFirestore.instance
                            .collection('Form_Requests_Info')
                            .doc(requestId)
                            .update({
                          'Status': 'Verified',
                        });
                        // Add a new document with specified fields
                        DocumentReference docRef = await metaData.add({
                          'type': 'Doctor',
                          'email': requests[i].email,
                          // 'status':'show'
                        });
                        FirebaseFirestore.instance
                            .collection('info_Doctors')
                            .add({
                          'id': docRef.id,
                          'Email': requests[i].email,
                          'Name': requests[i].name,
                          'Age': '',
                          'Location': requests[i]
                              .location, // Assuming age is a string, change accordingly
                          'Phone': '',
                          'Blogs': [],
                          'Bookings': [],
                          'Hospital': requests[i].orgName,
                          'License_Number': requests[i].licenseNumber,
                          'NationalId': '',
                          'Previous_Appointments': [],
                          'Profile_Picture':
                              "https://firebasestorage.googleapis.com/v0/b/mediverse-app.appspot.com/o/photos%2Fimages.jpeg.jpg?alt=media&token=817e3dcf-a8dd-484b-913a-8fcf65b70638",
                          'Rating': 0.0, // Assuming rating is a double
                          'Reviews': [],
                          'Speciality': '',
                          'State': 'Offline',
                          'Slots': [], // Empty list for slots
                          'Clinic-Appointments': {},
                          'Condition':
                              'Verified' // Empty map for clinic appointments
                        });
                        FirebaseFirestore.instance
                            .collection('Form_Requests_Info')
                            .doc(requestId)
                            .delete();
                        EmailService().sendEmail(acceptanceMailDoctor,
                            'Request Acceptance', 'rinosamyramy@gmail.com');
                      } else {
                        // Retrieve the document ID of the request
                        DocumentReference staffRef = await metaData.add({
                          'type': requests[i].staff,
                          'email': requests[i].email,
                          // 'status':'show'
                        });
                        log(requestId);
                        // Update the status of the request to "Accepted"
                        FirebaseFirestore.instance
                            .collection('Form_Requests_Info')
                            .doc(requestId)
                            .update({
                          'Status': 'Accepted',
                        });

                        FirebaseFirestore.instance.collection('Staff').add({
                          'id': staffRef.id,
                          'Email': requests[i].email,
                          'Name': requests[i].name,
                          'License_Number': requests[i].licenseNumber,
                          'Location': requests[i].location,
                          'Org Name': requests[i].orgName,
                          'Org Type': requests[i].orgType,
                          'Staff': requests[i].staff,
                          'Condition': 'Show'
                        });
                        FirebaseFirestore.instance
                            .collection('Form_Requests_Info')
                            .doc(requestId)
                            .delete();
                        EmailService().sendEmail(acceptaneMailStaff,
                            'Request Accepted', 'rinosamyramy@gmail.com');
                      }
                    },
                    onPressedDecline: () async {
                      String requestId = formRequestsSnapshot.data!.docs[i].id;

                      // Delete the document from Firestore
                      FirebaseFirestore.instance
                          .collection('Form_Requests_Info')
                          .doc(requestId)
                          .delete()
                          .then((value) {
                        // Successfully deleted the document
                        print('Request $requestId declined and removed');
                      }).catchError((error) {
                        // Error occurred while deleting the document
                        print('Failed to decline and remove request: $error');
                      });
                      EmailService().sendEmail(rejectionMail,
                          'Request Rejection', 'rinosamyramy@gmail.com');
                    },
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
