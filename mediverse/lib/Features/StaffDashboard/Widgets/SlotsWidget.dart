import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/SlotsModel.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/EachSlotWidget.dart';

class SlotsWidget extends StatelessWidget {
  SlotsWidget({
    super.key,
    required this.id,
    required this.orgName,
  });
  final scrollController = ScrollController();
  final String id;
  final String orgName;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentMonth = now.month;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Appointments')
          // .where(
          //   'FromDateMonth',
          //   isEqualTo: currentMonth,
          // )
          .where('D_uid', isEqualTo: id)
          .where('HospitalName', isEqualTo: orgName)
          .orderBy(
            'isoDate',
            descending: false,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<DocumentSnapshot> documents = snapshot.data!.docs;
          List<String> documentIds = documents.map((doc) => doc.id).toList();

          List<SlotsModel> slotsList = documents
              .map((doc) =>
                  SlotsModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();
          if (slotsList.isEmpty) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Center(
                    child: Text(
                  'No Slots Made ',
                  style: Themes.bodyLarge.copyWith(color: Colors.black),
                )),
              ],
            );
          }
          return SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                return SlotWidget(
                  slot: slotsList[index],
                  onDismissed: () async {
                    await deleteTimeSlotsRange(documentIds[index], id);
                    await deleteDocumentsByField(
                        'Appointments', documentIds[index]);
                  },
                );
              },
            ),
          );
        } else {
          return Center(
              child: Text(
            'No Slots Made ',
            style: Themes.bodyLarge.copyWith(color: Colors.black),
          ));
        }
      },
    );
  }
}

Future<void> deleteDocumentsByField(
    String collectionPath, String slotId) async {
  try {
// Get a reference to the document
    DocumentReference<Map<String, dynamic>> documentRef =
        FirebaseFirestore.instance.collection(collectionPath).doc(slotId);

    // Delete each document in the query results
    // Delete the document
    documentRef.delete().then((value) {
      print("Document successfully deleted!");
    }).catchError((error) {
      print("Error deleting document: $error");
    });
  } catch (e) {
    print(e.toString());
  }
}

// Future<void> deleteTimeSlotsRange(String slotId, String doctor_id) async {
//   // Reference to the appointments collection
//   CollectionReference appointments =
//       FirebaseFirestore.instance.collection('Appointments');

//   // Get the document snapshot from the appointments collection
//   DocumentSnapshot appointmentSnapshot = await appointments.doc(slotId).get();

//   if (appointmentSnapshot.exists) {
//     Map<String, dynamic>? appointmentData =
//         appointmentSnapshot.data() as Map<String, dynamic>?;

//     if (appointmentData != null) {
//       String hospitalName = appointmentData['HospitalName'];
//       String date = appointmentData['Date'];
//       String day = appointmentData['Day'];
//       List<String> timesToRemove = List<String>.from(appointmentData['Time']);

//       // Reference to the document containing the Slots array
//       DocumentReference doctorRef =
//           FirebaseFirestore.instance.collection('info_Doctors').doc(doctor_id);

//       // Get the document snapshot
//       DocumentSnapshot doctorSnapshot = await doctorRef.get();

//       if (doctorSnapshot.exists) {
//         // Extract the Slots array
//         Map<String, dynamic>? doctorData =
//             doctorSnapshot.data() as Map<String, dynamic>?;

//         List<dynamic> slots = doctorData?['Slots'];

//         // Find the slot with the matching hospitalName
//         int slotIndex =
//             slots.indexWhere((slot) => slot['Name'] == hospitalName);

//         if (slotIndex != -1) {
//           List<dynamic> timeSlots = slots[slotIndex]['Time Slots'];

//           // Find the time slot with the specified date and day
//           int timeSlotIndex = timeSlots.indexWhere(
//               (timeSlot) => timeSlot['Date'] == date && timeSlot['Day'] == day);

//           if (timeSlotIndex != -1) {
//             List<String> existingTimes =
//                 List<String>.from(timeSlots[timeSlotIndex]['Time']);
//             List<String> existingStatus =
//                 List<String>.from(timeSlots[timeSlotIndex]['Status']);

//             // Remove the specified times and corresponding statuses
//             for (String timeToRemove in timesToRemove) {
//               int indexToRemove = existingTimes.indexOf(timeToRemove);
//               if (indexToRemove != -1) {
//                 existingTimes.removeAt(indexToRemove);
//                 existingStatus.removeAt(indexToRemove);
//               }
//             }

//             // Update the time slot with the modified times and statuses
//             timeSlots[timeSlotIndex]['Time'] = existingTimes;
//             timeSlots[timeSlotIndex]['Status'] = existingStatus;

//             // If there are no more times left, remove the entire time slot entry
//             if (existingTimes.isEmpty) {
//               timeSlots.removeAt(timeSlotIndex);
//             }

//             // Update the modified time slots back to the slot
//             slots[slotIndex]['Time Slots'] = timeSlots;

//             // Update the Firestore document with the modified Slots array
//             await doctorRef.update({'Slots': slots});
//             print('Time slots range deleted successfully');
//           } else {
//             print('Time slot not found');
//           }
//         } else {
//           print('Slot with the matching name not found');
//         }
//       } else {
//         print('Doctor document does not exist');
//       }
//     } else {
//       print('Appointment data is null');
//     }
//   } else {
//     print('Appointment document does not exist');
//   }
// }
Future<void> deleteTimeSlotsRange(String slotId, String doctor_id) async {
  try {
    // Reference to the appointments collection
    CollectionReference appointments =
        FirebaseFirestore.instance.collection('Appointments');

    // Get the document snapshot from the appointments collection
    print('Fetching appointment snapshot for $slotId...');
    DocumentSnapshot appointmentSnapshot = await appointments.doc(slotId).get();
    print('Appointment snapshot fetched.');

    if (!appointmentSnapshot.exists) {
      print('Appointment document does not exist for $slotId');
      return;
    }

    Map<String, dynamic>? appointmentData =
        appointmentSnapshot.data() as Map<String, dynamic>?;

    if (appointmentData == null) {
      print('Appointment data is null for $slotId');
      return;
    }

    String hospitalName = appointmentData['HospitalName'];
    String date = appointmentData['Date'];
    String day = appointmentData['Day'];
    List<String> timesToRemove = List<String>.from(appointmentData['Time']);

    // Reference to the document containing the Slots array
    DocumentReference doctorRef =
        FirebaseFirestore.instance.collection('info_Doctors').doc(doctor_id);

    // Get the document snapshot
    print('Fetching doctor snapshot for $doctor_id...');
    DocumentSnapshot doctorSnapshot = await doctorRef.get();
    print('Doctor snapshot fetched.');

    if (!doctorSnapshot.exists) {
      print('Doctor document does not exist for $doctor_id');
      return;
    }

    // Extract the Slots array
    Map<String, dynamic>? doctorData =
        doctorSnapshot.data() as Map<String, dynamic>?;

    if (doctorData == null || !doctorData.containsKey('Slots')) {
      print('Doctor data or Slots array is null or missing for $doctor_id');
      return;
    }

    List<dynamic> slots = List.from(doctorData['Slots']);

    // Find the slot with the matching hospitalName
    int slotIndex = slots.indexWhere((slot) => slot['Name'] == hospitalName);

    if (slotIndex == -1) {
      print('Slot with the matching name not found: $hospitalName');
      return;
    }

    List<dynamic> timeSlots = List.from(slots[slotIndex]['Time Slots']);

    // Find the time slot with the specified date and day
    int timeSlotIndex = timeSlots.indexWhere(
        (timeSlot) => timeSlot['Date'] == date && timeSlot['Day'] == day);

    if (timeSlotIndex == -1) {
      print('Time slot not found for $date and $day');
      return;
    }

    List<String> existingTimes =
        List<String>.from(timeSlots[timeSlotIndex]['Time']);
    List<String> existingStatus =
        List<String>.from(timeSlots[timeSlotIndex]['Status']);

    // Remove the specified times and corresponding statuses
    for (String timeToRemove in timesToRemove) {
      int indexToRemove = existingTimes.indexOf(timeToRemove);
      if (indexToRemove != -1) {
        existingTimes.removeAt(indexToRemove);
        existingStatus.removeAt(indexToRemove);
      }
    }

    // Update the time slot with the modified times and statuses
    timeSlots[timeSlotIndex]['Time'] = existingTimes;
    timeSlots[timeSlotIndex]['Status'] = existingStatus;

    // If there are no more times left, remove the entire time slot entry
    if (existingTimes.isEmpty) {
      timeSlots.removeAt(timeSlotIndex);
    }

    // Update the modified time slots back to the slot
    slots[slotIndex]['Time Slots'] = timeSlots;

    // Update the Firestore document with the modified Slots array
    print('Updating doctor document with modified Slots...');
    await doctorRef.update({'Slots': slots});
    print('Time slots range deleted successfully');
  } catch (e) {
    print('Error deleting time slots range: $e');
  }
}
