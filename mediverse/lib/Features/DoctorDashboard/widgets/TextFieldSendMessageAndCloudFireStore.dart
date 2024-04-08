import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TextFieldSendMessageAndCloudFireStore extends StatelessWidget {
  const TextFieldSendMessageAndCloudFireStore({
    super.key,
    required this.controller,
    required this.messages,
    required ScrollController controller2,
    required this.onSubmitted,
    required this.onChanged,
  }) : _controller = controller2;

  final TextEditingController controller;
  final CollectionReference<Object?> messages;
  final ScrollController _controller;
  final void Function(String data) onSubmitted;
  final void Function(String data) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      autocorrect: true,
      controller: controller,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      // don't forget controller
      decoration: const InputDecoration(
        hintText: 'Send Message',
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding: EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
      ),
    );
  }
}
