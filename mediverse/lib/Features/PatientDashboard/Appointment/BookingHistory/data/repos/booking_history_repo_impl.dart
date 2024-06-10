import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingHistory/data/repos/booking_history_repo.dart';

class BookingHistoryRepoImpl extends BookingHistoryRepo {
  @override
  Future<Either<Failure, List<Booking>>> getBookings(String patient_id) async {
    List<Booking> bookingsList = [];
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('info_Patients')
          .doc(patient_id);
      DocumentSnapshot documentSnapshot = await documentReference.get();
      var patient_bookings = documentSnapshot.get('Bookings');
      for (var patient_booking in patient_bookings) {
        DocumentSnapshot booking_snapshot = await FirebaseFirestore.instance
            .collection('Bookings')
            .doc(patient_booking)
            .get();
        final booking_data = booking_snapshot.data();
        final booking = Booking.fromJson(booking_data, patient_booking);
        bookingsList.add(booking);
      }
      return right(bookingsList);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getDoctorNames(
      List<Booking> bookings) async {
    List<String> NamesList = [];
    try {
      for (Booking booking in bookings) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('info_Doctors')
            .doc(booking.Doctor_id)
            .get();
        String doctor_name = documentSnapshot.get('Name');
        NamesList.add(doctor_name);
      }
      return right(NamesList);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}
