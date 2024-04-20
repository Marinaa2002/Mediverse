import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:mediverse/AllModels/patient.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepo.dart';

class GetPatientInfoRepoImpl extends GetPatientInfoRepo {
  @override
  Future<Either<Failure, Patient>> getPatientInfoFunction(String email) async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('info_Patients')
          .where('Email', isEqualTo: email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final patientData = snapshot.docs.first.data();
        if (patientData is Map<String, dynamic>) {
          final patient = Patient.fromJson(patientData);
          return Right(patient); // Success
        }
      }
      return Left(
          ServerFailure(errMsg: 'Patient with email $email not found.'));
    } catch (e) {
      return Left(ServerFailure(errMsg: 'Failed to get patient data: $e'));
    }
  }
}
