import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/AllModels/requestModel.dart';
import 'package:mediverse/Constants/constant.dart';

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
                    onPressedAccept: () {
                      String requestId = formRequestsSnapshot.data!.docs[i].id;
                      if (requests[0].staff == "Doctor") {
                        // Update the status of the request to "Accepted"
                        FirebaseFirestore.instance
                            .collection('Form_Requests_Info')
                            .doc(requestId)
                            .update({
                          'Status': 'Verified',
                        });
                        FirebaseFirestore.instance
                            .collection('info_Doctors')
                            .add({
                          'Email': requests[i].email,
                          'Name': requests[i].name,
                          'Age':
                              '', // Assuming age is a string, change accordingly
                          'Phone': '',
                          'Blogs': [],
                          'Bookings': [],
                          'Hospital': '',
                          'License_Number': requests[i].licenseNumber,
                          'NationalId': '',
                          'Previous_Appointments': [],
                          'Profile_Picture': '',
                          'Rating': 0.0, // Assuming rating is a double
                          'Reviews': [],
                          'Speciality': '',
                          'State': 'Offline',
                          'Slots': [], // Empty list for slots
                          'Clinic-Appointments':
                              {}, // Empty map for clinic appointments
                        });
                      } else {
                        // Retrieve the document ID of the request

                        log(requestId);
                        // Update the status of the request to "Accepted"
                        FirebaseFirestore.instance
                            .collection('Form_Requests_Info')
                            .doc(requestId)
                            .update({
                          'Status': 'Accepted',
                        });

                        FirebaseFirestore.instance.collection('Staff').add({
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
                      }
                      //**************
                      //Mail goes here
                      //
                      //
                      //
                      // */
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
                      //**************
                      //Mail goes here
                      //
                      //
                      //
                      // */
                      // sendEmail();
                      // _sendEmail();
                      // EmailService().sendEmail(
                      //     name: requests[i].name,
                      //     email: 'rinosamyramy@gmail.com',
                      //     subject: 'Request Not Accepted',
                      //     message: rejectionMail);
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

//   // Function to send email
//   Future<void> sendEmailNotification(request) async {
//     // Define SMTP server details
//     final smtpServer = gmail('gpasu2023@gmail.com', 'GradProject2023');
//     String body = '''
// Dear Recipient,

// I hope this email finds you well.

// I regret to inform you that your recent request has been carefully reviewed, and unfortunately, we are unable to proceed with [specify reason for rejection]. Please be assured that your request received thorough consideration, and this decision was made after careful deliberation.

// We understand that this news may be disappointing, and we sincerely apologize for any inconvenience caused. Please know that we value your interest and efforts.

// Should you have any questions or require further clarification regarding this decision, please do not hesitate to reach out to us. We remain committed to assisting you in any way we can.

// Thank you for your understanding and cooperation.

// Sincerely,
// Mediverse
// ''';

//     final message = Message()
//       ..from = Address('gpasu2023@gmail.com', 'Mediverse')
//       ..recipients.add('rinosamyramy@gmail.com') // Recipient's email
//       ..subject = 'Request Not Accepted'
//       ..text = body;
//     // Email body

//     try {
//       // Send the email
//       final sendReport = await send(message, smtpServer);
//     } catch (e) {
//       print('Email sending failed: $e');
//     }
//   }

  // void sendEmail() async {
  //   Email email = Email(
  //     to: ['gpasu2023@gmail.com'],
  //     subject: 'Hello from Flutter',
  //     body:
  //         'This is a test email sent from a Flutter app using email_launcher package.',
  //   );
  //   try {
  //     EmailLauncher.launch(email);
  //   } catch (e) {}
  // }

  // void _sendEmail() async {
  //   try {
  //     await EmailJS.send(
  //       'service_yo90c7i',
  //       'template_av8arm2',
  //       {
  //         'user_email': 'rinosamyramy@gmail.com',
  //         'message': 'Hi',
  //       },
  //       const Options(
  //         publicKey: 'x0PSZcFpV5OULTvVo',
  //         privateKey: 'eNTW3JYpW0Xz5opCIs4-v',
  //       ),
  //     );
  //     print('SUCCESS!');
  //   } catch (error) {
  //     if (error is EmailJSResponseStatus) {
  //       print('ERROR... ${error.status}: ${error.text}');
  //     }
  //     print(error.toString());
  //   }
}
