import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:mediverse/AllModels/admin.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/AllModels/patient.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepo.dart';

import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/FetechAdminInformationRepo.dart';

import '../../../../../../Core/Errors/Failure.dart';

class getPatientInfoRepoImpl extends GetPatientInfoRepo {
  @override
  Future<Either<Failure, Patient>> getPatientInfoFunction(String id) async {
    try {
      final DocumentReference patientRef =
          FirebaseFirestore.instance.collection('info_Patients').doc(id);

      final snapshot = await patientRef.get();

      if (snapshot.exists) {
        final patientData = snapshot.data();
        if (patientData is Map<String, dynamic>) {
          final admin = Patient.fromJson(patientData);
          // Perform further actions with the doctor object if needed
          return Right(admin); // Success
        }
      }
      return Left(ServerFailure(errMsg: 'Doctor with ID $id does not exist.'));
    } catch (e) {
      return Left(ServerFailure(errMsg: 'Failed to get doctor data: $e'));
    }
  }
}
