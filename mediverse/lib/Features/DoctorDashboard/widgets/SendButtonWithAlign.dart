import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/SendButtonIcon.dart';

class SendButtonWithAlign extends StatelessWidget {
  const SendButtonWithAlign({
    super.key,
    required this.messages,
    required this.textEditingcontroller,
    required ScrollController scrollablecontroller,
  }) : _scrollablecontroller = scrollablecontroller;

  final CollectionReference<Object?> messages;
  final TextEditingController textEditingcontroller;
  final ScrollController _scrollablecontroller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(1, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
        child: SendIconButton(
            messages: messages,
            textEditingcontroller: textEditingcontroller,
            scrollablecontroller: _scrollablecontroller),
      ),
    );
  }
}
