import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';

class TextFieldForMsgs extends StatelessWidget {
  const TextFieldForMsgs({
    super.key,
    required this.controller,
    required this.messages,
    required ScrollController controller2,
  }) : _controller = controller2;

  final TextEditingController controller;
  final CollectionReference<Object?> messages;
  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: TextField(
          controller: controller,
          onSubmitted: (data) {
            if (data.trim().isNotEmpty) {
              messages.add(
                {kMessage: data, kCreatedAt: DateTime.now(), 'id': "B"},
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
          // don't forget controller
          decoration: const InputDecoration(
            hintText: 'Send Message',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
          ),
        ),
      ),
    );
  }
}
