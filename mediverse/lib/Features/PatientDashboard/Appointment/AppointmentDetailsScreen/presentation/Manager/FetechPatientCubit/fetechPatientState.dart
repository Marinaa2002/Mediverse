import 'package:mediverse/AllModels/patient.dart';

sealed class FetechPatientInfoState {}

final class FetechPatientInfoStateInitial extends FetechPatientInfoState {}

final class FetechPatientInfoStateLoading extends FetechPatientInfoState {}

final class FetechPatientInfoStateSuccess extends FetechPatientInfoState {
  final Patient patient;

  FetechPatientInfoStateSuccess({required this.patient});
}

final class FetechPatientInfoStateFailure extends FetechPatientInfoState {
  final String errMsg;

  FetechPatientInfoStateFailure({required this.errMsg});
}
