import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/UploadScreenPhoto.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/CameraIconButton.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/SendButtonWithAlign.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/TextFieldForMsgs.dart';

class ChattingTextFieldAndIcons extends StatelessWidget {
  const ChattingTextFieldAndIcons({
    super.key,
    required this.textEditingcontroller,
    required this.messages,
    required ScrollController scrollablecontroller,
    required this.doc_id,
    required this.patient_id,
    required this.onPressedCameraIcon,
  }) : _scrollablecontroller = scrollablecontroller;

  final TextEditingController textEditingcontroller;
  final CollectionReference<Object?> messages;
  final ScrollController _scrollablecontroller;
  final VoidCallback onPressedCameraIcon;
  final String patient_id;
  final String doc_id;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        TextFieldForMsgs(
          controller: textEditingcontroller,
          messages: messages,
          controller2: _scrollablecontroller,
          doc_id: doc_id,
          patient_id: patient_id,
        ),
        CameraIconButton(
          onPressed: onPressedCameraIcon,
          doc_id: doc_id,
          patient_id: patient_id,
        ),
        SendButtonWithAlign(
            doc_id: doc_id,
            patient_id: patient_id,
            messages: messages,
            textEditingcontroller: textEditingcontroller,
            scrollablecontroller: _scrollablecontroller),
      ],
    );
  }
}
