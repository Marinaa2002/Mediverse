part of 'patient_review_cubit.dart';

@immutable
abstract class PatientReviewState {}

class PatientReviewInitial extends PatientReviewState {}
class PatientReviewLoading extends PatientReviewState {}
class PatientReviewSuccess extends PatientReviewState {
  List<ReviewModel> reviewModellList;
  PatientReviewSuccess({required this.reviewModellList});
}
class PatientReviewFailure extends PatientReviewState {
  String errMessage;
  PatientReviewFailure(this.errMessage);
}
