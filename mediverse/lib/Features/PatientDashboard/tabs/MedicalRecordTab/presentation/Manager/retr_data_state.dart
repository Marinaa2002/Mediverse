import 'package:flutter/cupertino.dart';
import '../../../../MedicalRecord/MedicalRecordEditScreen/data/models/MRmodel.dart';

@immutable
abstract class RetrDataState {}

class RetrDataInitial extends RetrDataState {}

class RetrDataLoading extends RetrDataState {}

class RetrDataSuccess extends RetrDataState {
  final List<MRmodel> medicalRecords;
  RetrDataSuccess({required this.medicalRecords});
}

class RetrDataFailure extends RetrDataState {
  final String errMsg;
  RetrDataFailure({required this.errMsg});
}