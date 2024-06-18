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
  });
  final scrollController = ScrollController();
  final String id;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentMonth = now.month;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Appointments')
          .where(
            'FromDateMonth',
            isEqualTo: currentMonth,
          )
          .where('D_uid', isEqualTo: id)
          .orderBy(
            'FromDateDay',
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
                  onDismissed: () {
                    deleteDocumentsByField('Appointments', documentIds[index]);
                    deleteSlot(documentIds[index], id);
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

void deleteDocumentsByField(String collectionPath, String slotId) async {
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

Future<void> deleteSlot(String slotId, String doctor_id) async {
  // Reference to the document containing the Slots array
  DocumentReference doctorRef =
      FirebaseFirestore.instance.collection('info_Doctors').doc(doctor_id);

  // Get the document snapshot
  DocumentSnapshot doctorSnapshot = await doctorRef.get();

  if (doctorSnapshot.exists) {
    // Extract the Slots array
    Map<String, dynamic>? data = doctorSnapshot.data() as Map<String, dynamic>?;

    List<dynamic> slots = data?['Slots'];

    // Find and remove the slot with the specified slotId
    slots.removeWhere((slot) => slot['slot_id'] == slotId);

    // Update the Firestore document with the modified Slots array
    await doctorRef.update({'Slots': slots});
    print('Slot deleted successfully');
  } else {
    print('Document does not exist');
  }
}
