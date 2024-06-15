import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/TextFieldSendMessageAndCloudFireStore.dart';

class TextFieldForMsgs extends StatelessWidget {
  TextFieldForMsgs({
    super.key,
    required this.controller,
    required this.messages,
    required ScrollController controller2,
    required this.doc_id,
    required this.patient_id,
  }) : _controller = controller2;

  final TextEditingController controller;
  final CollectionReference<Object?> messages;
  final ScrollController _controller;
  final String doc_id;

  final String patient_id;
  CollectionReference chatHistory =
      FirebaseFirestore.instance.collection('ChatHistory');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: TextFieldSendMessageAndCloudFireStore(
          controller: controller,
          messages: messages,
          onSubmitted: (data) async {
            if (data.trim().isNotEmpty) {
              String nowRole = "";
              if (patient_id == globalcurrentUserId) {
                nowRole = "Patient";
              } else {
                nowRole = "Doctor";
              }
              messages.add(
                {
                  kMessage: data,
                  kCreatedAt: DateTime.now(),
                  'patient_id': patient_id,
                  'doctor_id': doc_id,
                  "imageUrl": '',
                  'Sender': nowRole
                },
              );
              QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                  .collection('ChatHistory')
                  .where('doctor_id', isEqualTo: doc_id)
                  .where('patient_id', isEqualTo: patient_id)
                  .get();

              if (querySnapshot.docs.isEmpty) {
                // Document with specified fields exists
                chatHistory.add(
                  {
                    'patient_id': patient_id,
                    'doctor_id': doc_id,
                    kCreatedAt: DateTime.now(),
                    'isRead': false
                  },
                );
                log('Document do not exist!');
              } else {
                // Document with specified fields exists
                chatHistory
                    .doc(querySnapshot.docs[0].id)
                    .update({kCreatedAt: DateTime.now(), 'isRead': false});
                log('Document exist!');
              }
            }
            controller.clear();
            _controller.animateTo(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
            textData = "";
          },
          onChanged: (value) {
            textData = value;
          },
          controller2: _controller,
        ),
      ),
    );
  }
}
