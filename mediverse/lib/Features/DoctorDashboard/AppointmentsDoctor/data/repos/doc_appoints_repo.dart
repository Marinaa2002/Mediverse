import 'package:dartz/dartz.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Core/Errors/Failure.dart';

abstract class DocAppointsRepo {
  Future<Either<Failure, List<Booking>>> getBookings(String doctor_id);
  Future<Either<Failure, List<String>>> getPatientNames(List<Booking> bookings);
}
