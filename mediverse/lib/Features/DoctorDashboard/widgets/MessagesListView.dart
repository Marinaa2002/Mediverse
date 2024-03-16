import 'package:flutter/material.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatMessage.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView(
      {super.key, required this.messagesList, required this.controller});

  final List<Message> messagesList;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          reverse: true,
          controller: controller,
          itemCount: messagesList.length,
          itemBuilder: (context, index) {
            if (messagesList[index].id == "A") {
              return ChatMessage(
                message: messagesList[index],
                isMe: true,
              );
            } else {
              return ChatMessage(
                message: messagesList[index],
                isMe: false,
              );
            }
          }),
    );
  }
}
