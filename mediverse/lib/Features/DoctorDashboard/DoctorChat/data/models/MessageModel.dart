import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final String patient_id;
  final String createdAt;
  final String doctor_id;
  final String? imageUrl;
  final String sender;

  //final Image? image;
  Message(
      {required this.message,
      this.imageUrl,
      required this.patient_id,
      required this.doctor_id,
      required this.createdAt,
      required this.sender});

  factory Message.fromJson(jsonData) {
    print(jsonData['createdAt'].runtimeType);
    return Message(
        message: jsonData['message'],
        createdAt: jsonData['createdAt'].toString(), // Cast to Timestamp
        patient_id: jsonData['patient_id'],
        doctor_id: jsonData['doctor_id'],
        imageUrl: jsonData['imageUrl'] ?? '',
        sender: jsonData['Sender']);
  }
}
