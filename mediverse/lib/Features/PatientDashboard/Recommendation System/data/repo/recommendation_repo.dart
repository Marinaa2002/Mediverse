import 'package:dartz/dartz.dart';
import 'package:mediverse/Core/Errors/Failure.dart';

abstract class RecommendationRepo {
  Future<Either<Failure, List<dynamic>>> getMedicalHistory(String doctor_id);
}
