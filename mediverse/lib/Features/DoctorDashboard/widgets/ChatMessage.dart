import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart'; // Import the intl package for date formatting

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.message, required this.isMe});

  final Message message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    // Extract seconds and nanoseconds from the string
    int seconds = int.parse(message.createdAt.split(',')[0].split('=')[1]);
    int nanoseconds = int.parse(
        message.createdAt.split(',')[1].split('=')[1].replaceAll(')', ''));

    // Create a DateTime object from seconds and nanoseconds
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(
        seconds * 1000000 + nanoseconds ~/ 1000);

    // Format the DateTime to 'HH:mm'
    String formattedTime =
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    log(formattedTime);
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: isMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
          //lo za3lo 8ir al color lo la2 5lassssss
          color: isMe ? kprimaryColor : Color(0xffee8b60),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.message ?? '',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  formattedTime,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
