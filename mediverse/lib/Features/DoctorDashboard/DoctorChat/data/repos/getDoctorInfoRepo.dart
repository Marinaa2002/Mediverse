import 'package:either_dart/either.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/PaymentIndentInputModel.dart';

abstract class GetDoctorInfoRepo {
  Future<Either<Failure, Doctor>> getDoctorInfoFunction(String id);
}
