import 'package:dartz/dartz.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Core/Errors/Failure.dart';

abstract class BookingHistoryRepo {
  Future<Either<Failure, List<Booking>>> getBookings(String doctor_id);
  Future<Either<Failure, List<String>>> getDoctorNames(List<Booking> bookings);
}
