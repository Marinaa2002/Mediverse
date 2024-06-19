import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatMessage.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatMessageWithPhoto.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/DateChat.dart';

class MessagesListView extends StatelessWidget {
  MessagesListView({
    super.key,
    required this.messagesList,
    required this.controller,
    this.doc_id,
    this.patient_id,
    this.nowRole,
    required this.dates,
  });

  final List<Message> messagesList;
  final ScrollController controller;
  final List<String> dates;

  String? patient_id = '';
  String? doc_id = '';
  String? nowRole = '';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          reverse: true,
          controller: controller,
          itemCount: messagesList.length,
          itemBuilder: (context, index) {
            if (messagesList[index].sender == "Doctor" &&
                messagesList[index].doctor_id == globalcurrentUserId &&
                messagesList[index].imageUrl == '') {
              // return Column(
              //   children: [
              //     DateOfChat(
              //       currentDate: dates[index],
              //       chatesSize: messagesList.length,
              //       currentIndex: index,
              //     ),
              //     ChatMessage(
              //       message: messagesList[index],
              //       isMe: true,
              //     ),
              //   ],
              // );
              return ChatMessage(
                message: messagesList[index],
                isMe: true,
              );
            } else if (messagesList[index].sender == "Doctor" &&
                messagesList[index].doctor_id == globalcurrentUserId &&
                messagesList[index].imageUrl != '') {
              // return Column(
              //   children: [
              //     DateOfChat(
              //       currentDate: dates[index],
              //       chatesSize: messagesList.length,
              //       currentIndex: index,
              //     ),
              //     ChatMessageWithPhoto(
              //       message: messagesList[index],
              //       isMe: true,
              //     ),
              //   ],
              // );
              return ChatMessageWithPhoto(
                message: messagesList[index],
                isMe: true,
              );
            } else if (messagesList[index].sender != "Doctor" &&
                messagesList[index].doctor_id == globalcurrentUserId &&
                messagesList[index].imageUrl == '') {
              // return Column(
              //   children: [
              //     DateOfChat(
              //       currentDate: dates[index],
              //       chatesSize: messagesList.length,
              //       currentIndex: index,
              //     ),
              //     ChatMessage(
              //       message: messagesList[index],
              //       isMe: false,
              //     ),
              //   ],
              // );
              return ChatMessage(
                message: messagesList[index],
                isMe: false,
              );
            } else if (messagesList[index].sender != "Doctor" &&
                messagesList[index].doctor_id == globalcurrentUserId &&
                messagesList[index].imageUrl != '') {
              // return Column(
              //   children: [
              //     DateOfChat(
              //       currentDate: dates[index],
              //       chatesSize: messagesList.length,
              //       currentIndex: index,
              //     ),
              //     ChatMessageWithPhoto(
              //       message: messagesList[index],
              //       isMe: false,
              //     ),
              //   ],
              // );
              return ChatMessageWithPhoto(
                message: messagesList[index],
                isMe: false,
              );
            }
            if (messagesList[index].sender == "Patient" &&
                messagesList[index].patient_id == globalcurrentUserId &&
                messagesList[index].imageUrl == '') {
              // return Column(
              //   children: [
              //     DateOfChat(
              //       currentDate: dates[index],
              //       chatesSize: messagesList.length,
              //       currentIndex: index,
              //     ),
              //     ChatMessage(
              //       message: messagesList[index],
              //       isMe: true,
              //     ),
              //   ],
              // );
              return ChatMessage(
                message: messagesList[index],
                isMe: true,
              );
            } else if (messagesList[index].sender == "Patient" &&
                messagesList[index].patient_id == globalcurrentUserId &&
                messagesList[index].imageUrl != '') {
              // return Column(
              //   children: [
              //     DateOfChat(
              //       currentDate: dates[index],
              //       chatesSize: messagesList.length,
              //       currentIndex: index,
              //     ),
              //     ChatMessageWithPhoto(
              //       message: messagesList[index],
              //       isMe: true,
              //     ),
              //   ],
              // );
              return ChatMessageWithPhoto(
                message: messagesList[index],
                isMe: true,
              );
            } else if (messagesList[index].sender != "Patient" &&
                messagesList[index].patient_id == globalcurrentUserId &&
                messagesList[index].imageUrl == '') {
              // return Column(
              //   children: [
              //     DateOfChat(
              //       currentDate: dates[index],
              //       chatesSize: messagesList.length,
              //       currentIndex: index,
              //     ),
              //     ChatMessage(
              //       message: messagesList[index],
              //       isMe: false,
              //     ),
              //   ],
              // );
              return ChatMessage(
                message: messagesList[index],
                isMe: false,
              );
            } else if (messagesList[index].sender != "Patient" &&
                messagesList[index].patient_id == globalcurrentUserId &&
                messagesList[index].imageUrl != '') {
              // return Column(
              //   children: [
              //     DateOfChat(
              //       currentDate: dates[index],
              //       chatesSize: messagesList.length,
              //       currentIndex: index,
              //     ),
              //     ChatMessageWithPhoto(
              //       message: messagesList[index],
              //       isMe: false,
              //     ),
              //   ],
              // );
              return ChatMessageWithPhoto(
                message: messagesList[index],
                isMe: false,
              );
            }
          }),
    );
  }
}
