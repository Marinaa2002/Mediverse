import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class LabResultModel {
  final String imageUrl;
  final Timestamp pictureDate;
  final String id;
  final String lab_id;

  LabResultModel(this.imageUrl, this.pictureDate, this.id, this.lab_id);

  factory LabResultModel.fromJson(jsonData) {
    return LabResultModel(
      jsonData['imageUrl'],
      jsonData['createdAt'],
      jsonData['id'],
      jsonData['Lab_id'],
    );
  }
}
