import 'package:either_dart/either.dart';
import 'package:mediverse/AllModels/admin.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/AllModels/patient.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/PaymentIndentInputModel.dart';

abstract class GetPatientInfoRepo {
  Future<Either<Failure, Patient>> getPatientInfoFunction(String id);
}
