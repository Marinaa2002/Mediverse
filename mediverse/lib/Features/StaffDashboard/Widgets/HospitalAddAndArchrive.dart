import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/Staff.dart';

import 'HospitalAddHideWidget.dart';

class HospitalViewAndArchrive extends StatelessWidget {
  HospitalViewAndArchrive({
    super.key,
  });
  bool option = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 15, 5, 0),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Staff').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final staffs = snapshot.data?.docs
              .map((doc) => StaffModel.fromJson(doc.data()))
              .toList();
          return Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: staffs?.length,
              itemBuilder: (context, i) {
                return HospitalAddHideWidget(
                    option: option,
                    hospitalName: staffs![i].orgName,
                    onChanged: (newvalue) {
                      String staffid = snapshot.data!.docs[i].id;
                      if (newvalue == true) {
                        FirebaseFirestore.instance
                            .collection('Staff')
                            .doc(staffid)
                            .update({
                          'Condition': 'Show',
                        });
                        option = true;
                      } else {
                        FirebaseFirestore.instance
                            .collection('Staff')
                            .doc(staffid)
                            .update({
                          'Condition': 'Hide',
                        });
                        option = false;
                      }
                    });
              },
            ),
          );
        },
      ),
    );
  }
}
