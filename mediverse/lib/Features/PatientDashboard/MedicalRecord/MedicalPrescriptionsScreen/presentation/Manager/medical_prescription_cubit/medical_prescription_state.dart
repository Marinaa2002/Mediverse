part of 'medical_prescription_cubit.dart';

@immutable
abstract class MedicalPrescriptionState {}

class MedicalPrescriptionInitial extends MedicalPrescriptionState {}
class MedicalPrescriptionLoading extends MedicalPrescriptionState {}
class MedicalPrescriptionSuccess extends MedicalPrescriptionState {
  List<MedicalPrescriptionModel> medicalModelList;

  MedicalPrescriptionSuccess({required this.medicalModelList});
}
class MedicalPrescriptionFailure extends MedicalPrescriptionState {
  String errMessage;
  MedicalPrescriptionFailure(this.errMessage);
}
