import 'package:dartz/dartz.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Core/Errors/Failure.dart';

abstract class DocBookingsRepo {
  Future<Either<Failure, List<Booking>>> getAppointments(String doctor_id);
  Future<Either<Failure, List<String>>> getPatientNames(
      List<Booking> appointments);
}
