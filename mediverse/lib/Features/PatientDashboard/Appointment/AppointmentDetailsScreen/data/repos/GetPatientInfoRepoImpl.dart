import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:mediverse/AllModels/patient.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepo.dart';

class GetPatientInfoRepoImpl extends GetPatientInfoRepo {
  @override
  Future<Either<Failure, Patient>> getPatientInfoFunction(String id) async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('info_Patients')
          .doc(globalcurrentUserId).get();

      if (snapshot.exists) {
        final patientData = snapshot.data();
        if (patientData is Map<String, dynamic>) {
          final patient = Patient.fromJson(patientData, globalcurrentUserId);
          return Right(patient); // Success
        }
      }
      return Left(ServerFailure(errMsg: 'Patient with email $id not found.'));
    } catch (e) {
      return Left(ServerFailure(errMsg: 'Failed to get patient data: $e'));
    }
  }
}
