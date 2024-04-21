import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
import '../../../../../Core/Errors/Failure.dart';

abstract class ProfilePatientRepo{
  updateName({required String? name});
  updateAge({required String? age});
  updateNationalId({required String? nationalId});
  updatePhoneNum({required String? phoneNum});
  updatePicture({required String? picture});
}