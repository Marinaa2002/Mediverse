import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Core/utils/serviceLocator.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/models/reviewModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/repos/patient_review_repo.dart';
import 'package:uuid/uuid.dart';
import '../../../../../../Core/Errors/Failure.dart';

class PatientReviewRepoImpl extends PatientReviewRepo {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('Review');
  final currentUser = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<Either<Failure, String>> sendReviews(
      {required double rating,
      required String textReview,
      required String name,
      required String doctor_id}) async {
    try {
      String review_id = idServiceLocator.get<Uuid>().v4();
      DocumentReference documentReference = messages.doc(review_id);
      documentReference.set({
        'createdAt': DateTime.now(),
        'Text': textReview,
        'Rating': rating,
        'Patient_id': currentUser,
        'Doctor_id': doctor_id,
        'Name': name,
      });
      return right(review_id);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> getReviews(
      {required QuerySnapshot event}) async {
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

  @override
  Future<Either<Failure, List<ReviewModel>>> getDocReviews({
    required String doctor_id,
  }) async {
    List<ReviewModel> Reviews_List = [];
    try {
      DocumentReference doc_reference =
          FirebaseFirestore.instance.collection('info_Doctors').doc(doctor_id);
      DocumentSnapshot doctor = await doc_reference.get();
      var doctor_reviews = doctor.get('Reviews');
      for (var doc_review in doctor_reviews) {
        DocumentSnapshot review_snapshot = await FirebaseFirestore.instance
            .collection('Review')
            .doc(doc_review)
            .get();
        final review_data = review_snapshot.data();
        final review = ReviewModel.fromJson(review_data);
        Reviews_List.add(review);
      }
      return right(Reviews_List);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}
