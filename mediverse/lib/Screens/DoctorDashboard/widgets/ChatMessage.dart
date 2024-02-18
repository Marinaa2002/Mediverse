import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({super.key, required this.message, required this.isMe});
  String message;
  double? width;
  double? height;

// Controls how the MessageBubble will be aligned.
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? AlignmentDirectional(1, 0) : AlignmentDirectional(-1, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
        child: Container(
          constraints: BoxConstraints(maxWidth: 200),
          // width: width,
          // height: height,
          decoration: BoxDecoration(
            color: isMe ? Color.fromARGB(224, 57, 210, 192) : Color.fromARGB(224, 238, 139, 96),
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
            
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              message,
              style: Themes.bodyLarge,
              maxLines: 10,
              softWrap: true,
            ),
          ),
        ),
      ),
    );
  }
}
