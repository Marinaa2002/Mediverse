import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';

import '../../../../../../Core/Errors/Failure.dart';

abstract class LabResultsRepo{

  sendLabs({required String now_date, required String imageUrl});
  Future<Either<Failure , List<LabResultModel>>> getLabs({required QuerySnapshot event});
}