import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/models/reviewModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/repos/patient_review_repo.dart';
import '../../../../../../Core/Errors/Failure.dart';

class PatientReviewRepoImpl extends PatientReviewRepo {
  CollectionReference messages =
  FirebaseFirestore.instance.collection('Review');
  final currentUser = FirebaseAuth.instance.currentUser!.uid;

  @override
  sendReviews({required double rating, required String textReview,
    required String name, required String doctor_id}) async{
    try {
      messages.add({
        'createdAt': DateTime.now(),
        'Text': textReview,
        'Rating' : rating,
        'Patient_id': currentUser,
        'Doctor_id' : doctor_id,
        'Name' : name,
      });
    } on Exception catch (e) {

    }
  }

  @override
  Future<Either<Failure , List<ReviewModel>>> getReviews({required QuerySnapshot event}) async{
    try {
      List<ReviewModel> messageList = [];
      for (var doc in event.docs) {
        messageList.add(ReviewModel.fromJson(doc));
      }
      return right(messageList);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

}