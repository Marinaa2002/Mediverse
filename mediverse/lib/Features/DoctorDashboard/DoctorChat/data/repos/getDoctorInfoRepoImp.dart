import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Core/utils/StripeService.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/repos/getDoctorInfoRepo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/PaymentIndentInputModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/repos/Check_out_repo.dart';

import '../../../../../../Core/Errors/Failure.dart';

class GetDoctorInfoRepoImp extends GetDoctorInfoRepo {
  @override
  Future<Either<Failure, Doctor>> getDoctorInfoFunction(String id) async {
    try {
      final DocumentReference doctorRef =
          FirebaseFirestore.instance.collection('info_Doctors').doc(id);

      final snapshot = await doctorRef.get();

      if (snapshot.exists) {
        final doctorData = snapshot.data();
        if (doctorData is Map<String, dynamic>) {
          final doctor = Doctor.fromJson(doctorData);
          // Perform further actions with the doctor object if needed
          return Right(doctor); // Success
        }
      }
      return Left(ServerFailure(errMsg: 'Doctor with ID $id does not exist.'));
    } catch (e) {
      return Left(ServerFailure(errMsg: 'Failed to get doctor data: $e'));
    }
  }
}
