import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalPrescriptionModel {
  final String imageUrl;
  final Timestamp createdAt;
  final String id;

  MedicalPrescriptionModel(this.id, this.imageUrl, this.createdAt);

  factory MedicalPrescriptionModel.fromJson(jsonData) {
    return MedicalPrescriptionModel(
      jsonData['id'],
      jsonData['imageUrl'],
      jsonData['createdAt'],
    );
  }
}
