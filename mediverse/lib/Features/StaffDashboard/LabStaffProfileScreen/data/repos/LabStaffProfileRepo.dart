import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
import '../../../../../Core/Errors/Failure.dart';

abstract class LabStaffProfileRepo{
  updateName({required String? name});
  updateOrgName({required String? orgName});
  updateOrgType({required String? orgType});
  updateLocation({required String? location});
  updatePicture({required String? picture});
}