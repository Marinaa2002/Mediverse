import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChattingTextFieldAndIcon.dart';

class AllAboutTextFieldAndIconsSendAndCamera extends StatelessWidget {
  const AllAboutTextFieldAndIconsSendAndCamera({
    super.key,
    required this.textEditingcontroller,
    required this.messages,
    required ScrollController scrollablecontroller,
    required this.onPressedCameraIcon,
  }) : _scrollablecontroller = scrollablecontroller;

  final TextEditingController textEditingcontroller;
  final CollectionReference<Object?> messages;
  final ScrollController _scrollablecontroller;
  final VoidCallback onPressedCameraIcon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(241, 211, 189, 2),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: ChattingTextFieldAndIcons(
            textEditingcontroller: textEditingcontroller,
            messages: messages,
            scrollablecontroller: _scrollablecontroller,
            onPressedCameraIcon: onPressedCameraIcon,
          ),
        ),
      ),
    );
  }
}
