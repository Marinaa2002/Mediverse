import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/PatientDashboard/Recommendation%20System/data/repo/recommendation_repo.dart';

class RecommendationRepoImpl extends RecommendationRepo {
  @override
  Future<Either<Failure, List<dynamic>>> getMedicalHistory(
      String patientID) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('info_Patients')
          .doc(patientID)
          .get();
      final List<dynamic> medicalRecord =
          documentSnapshot.get('Medical Records');
      return right(medicalRecord);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}
