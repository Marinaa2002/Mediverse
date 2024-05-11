import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/TextFieldSendMessageAndCloudFireStore.dart';

class TextFieldForMsgs extends StatelessWidget {
  const TextFieldForMsgs({
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: TextFieldSendMessageAndCloudFireStore(
          controller: controller,
          messages: messages,
          onSubmitted: (data) {
            if (data.trim().isNotEmpty) {
              messages.add(
                {
                  kMessage: data,
                  kCreatedAt: DateTime.now(),
                  'patient_id': patient_id,
                  'doctor_id': doc_id,
                  "imageUrl": ''
                },
              );
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
