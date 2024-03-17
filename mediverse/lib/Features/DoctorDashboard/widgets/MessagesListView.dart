import 'package:flutter/material.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatMessage.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatMessageWithPhoto.dart';

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
            if (messagesList[index].id == "A" &&
                messagesList[index].imageUrl == '') {
              return ChatMessage(
                message: messagesList[index],
                isMe: true,
              );
            } else if (messagesList[index].id == "A" &&
                messagesList[index].imageUrl != '') {
              return ChatMessageWithPhoto(
                message: messagesList[index],
                isMe: true,
              );
            } else if (messagesList[index].id == "B" &&
                messagesList[index].imageUrl == '') {
              return ChatMessage(
                message: messagesList[index],
                isMe: false,
              );
            } else if (messagesList[index].id == "B" &&
                messagesList[index].imageUrl != '') {
              return ChatMessageWithPhoto(
                message: messagesList[index],
                isMe: false,
              );
            }
          }),
    );
  }
}
