import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../Core/Errors/Failure.dart';
import '../models/reviewModel.dart';

abstract class PatientReviewRepo{

  Future<Either<Failure, String>> sendReviews({required double rating, required String textReview, required String name, required String doctor_id});
  Future<Either<Failure , List<ReviewModel>>> getReviews({required QuerySnapshot event});
  Future<Either<Failure , List<ReviewModel>>> getDocReviews({required String doctor_id});
}