import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/data/models/medical_prescription_model.dart';

import '../../../../../../Core/Errors/Failure.dart';

abstract class MedicalPrescriptionRepo {
  sendLabs(
      {required String id, required String now_date, required String imageUrl});
  Future<Either<Failure, List<MedicalPrescriptionModel>>> getLabs(
      {required QuerySnapshot event});
}
