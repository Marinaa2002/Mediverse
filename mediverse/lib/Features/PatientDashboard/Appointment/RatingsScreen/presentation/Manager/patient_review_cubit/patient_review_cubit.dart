import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/models/reviewModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/repos/patient_review_repo.dart';
import 'package:meta/meta.dart';

part 'patient_review_state.dart';

class PatientReviewCubit extends Cubit<PatientReviewState> {
  PatientReviewCubit(this.patientReviewRepo) : super(PatientReviewInitial());

  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  final PatientReviewRepo patientReviewRepo;
  var messages = FirebaseFirestore.instance.collection('Review');


  void sendReviewModel({required double rating, required String doctor_id,
    required String textReview,required String name}) {
    emit(PatientReviewLoading());
    try {
      patientReviewRepo.sendReviews(rating: rating, doctor_id: doctor_id,
          textReview: textReview, name: name);
    } on Exception catch (e) {
      emit(PatientReviewFailure('Something went wrong, Try again'));
    }
  }

  void getReviewModels() async{
    emit(PatientReviewLoading());
    await messages.orderBy('createdAt', descending: true).snapshots().listen((event) async {
      var result = await patientReviewRepo.getReviews(event: event);
      result.fold((left) =>
          emit(PatientReviewFailure(left.errMsg)),
              (right) =>
              emit(PatientReviewSuccess(reviewModellList: right))
      );
    });
  }
}
