import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/models/reviewModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/repos/patient_review_repo.dart';
import 'package:meta/meta.dart';

part 'patient_review_state.dart';

class PatientReviewCubit extends Cubit<PatientReviewState> {
  PatientReviewCubit(this.patientReviewRepo, this.Doctor_id)
      : super(PatientReviewInitial());

  final Doctor_id;

  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  final PatientReviewRepo patientReviewRepo;
  var messages;

  void sendReviewModel(
      {required double rating,
      required String textReview,
      required String name}) async {
    emit(PatientReviewLoading());
    try {
      var review_id = await patientReviewRepo.sendReviews(
          rating: rating,
          textReview: textReview,
          name: name,
          doctor_id: Doctor_id);

      review_id.fold((left) => null, (right) {
        var doctor_data = FirebaseFirestore.instance
            .collection('info_Doctors')
            .doc(Doctor_id);
        doctor_data.update({
          'Reviews': FieldValue.arrayUnion([right]),
        });
      });
      // String review_id = patientReviewRepo.sendReviews(
      //     rating: rating,
      //     doctor_id: Doctor_id,
      //     textReview: textReview,
      //     name: name);
    } on Exception catch (e) {
      emit(PatientReviewFailure('Something went wrong, Try again'));
    }
  }

  void getReviewModels() async {
    emit(PatientReviewLoading());
    await messages
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((event) async {
      var result = await patientReviewRepo.getReviews(event: event);
      result.fold((left) => emit(PatientReviewFailure(left.errMsg)),
          (right) => emit(PatientReviewSuccess(reviewModellList: right)));
    });
  }

  void getDoctorReviews() async {
    emit(PatientReviewLoading());
    var result = await patientReviewRepo.getDocReviews(doctor_id: Doctor_id);
    result.fold((left) => emit(PatientReviewFailure(left.errMsg)),
        (right) => emit(PatientReviewSuccess(reviewModellList: right)));
  }
}
