import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
import '../../../../../Core/Errors/Failure.dart';

abstract class AdminProfileRepo{
  updateName({required String? name});
  updatePhoneNum({required String? phoneNum});
  updatePicture({required String? picture});
  updateEmail({required String? email});
}