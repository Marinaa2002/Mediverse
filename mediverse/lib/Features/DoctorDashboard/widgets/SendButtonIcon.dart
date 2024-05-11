import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';

class SendIconButton extends StatelessWidget {
  SendIconButton({
    super.key,
    required this.messages,
    required this.textEditingcontroller,
    required ScrollController scrollablecontroller,
    required this.doc_id,
    required this.patient_id,
  }) : _scrollablecontroller = scrollablecontroller;

  final CollectionReference<Object?> messages;
  final TextEditingController textEditingcontroller;
  final ScrollController _scrollablecontroller;
  final String patient_id;
  final String? doc_id;
  CollectionReference chatHistory =
      FirebaseFirestore.instance.collection('ChatHistory');

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.send,
        color: kSecondaryTextColor,
        size: 24,
      ),
      onPressed: () {
        if (textData.trim().isNotEmpty) {
          messages.add(
            {
              kMessage: textData,
              kCreatedAt: DateTime.now(),
              'patient_id': patient_id,
              'doctor_id': doc_id,
              'imageUrl': ''
            },
          );
          chatHistory.add(
            {
              'patient_id': patient_id,
              'doctor_id': doc_id,
            },
          );
        }
        textEditingcontroller.clear();
        _scrollablecontroller.animateTo(0,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        textData = "";
      },
    );
  }
}
