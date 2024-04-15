import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
import '../../../../../Core/Errors/Failure.dart';

abstract class ProfilePatientRepo{
  updatePatientInfo({required String? uid,required String name, required String age, required String phoneNum, required String email, required String national_id});
  Future<Either<Failure , List<PatientProfileModel>>> getPatientInfo({required QuerySnapshot event});
}