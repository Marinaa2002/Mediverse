import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/SlotsModel.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/EachSlotWidget.dart';

class SlotsWidget extends StatelessWidget {
  SlotsWidget({
    super.key,
  });
  final scrollController = ScrollController();

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
                    deleteDocumentsByField('Appointments', 'D_uid', 'A');
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

void deleteDocumentsByField(
    String collectionPath, String fieldName, dynamic fieldValue) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(collectionPath)
        .where(fieldName, isEqualTo: fieldValue)
        .get();

    // Delete each document in the query results
    for (var doc in querySnapshot.docs) {
      doc.reference.delete();
    }
  } catch (e) {
    print(e.toString());
  }
}
