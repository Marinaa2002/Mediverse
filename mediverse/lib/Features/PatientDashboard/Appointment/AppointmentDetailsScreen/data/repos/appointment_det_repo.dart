import 'package:dartz/dartz.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Core/Errors/Failure.dart';

abstract class AppointmentDetailsRepo {
  Future<Either<Failure,Doctor>> fetchDoctorInfo(String doctorID);
}
