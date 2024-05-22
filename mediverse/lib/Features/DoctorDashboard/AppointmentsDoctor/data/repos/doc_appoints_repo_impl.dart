import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/DoctorDashboard/AppointmentsDoctor/data/repos/doc_appoints_repo.dart';

class DocAppointsRepoImpl extends DocAppointsRepo {
  @override
  Future<Either<Failure, List<Booking>>> getBookings(String doctor_id) async {
    List<Booking> bookingsList = [];
    try {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('info_Doctors').doc(doctor_id);
      DocumentSnapshot documentSnapshot = await documentReference.get();
      var doctor_bookings = documentSnapshot.get('Bookings');
      for (var doc_booking in doctor_bookings) {
        DocumentSnapshot booking_snapshot = await FirebaseFirestore.instance
            .collection('Bookings')
            .doc(doc_booking)
            .get();
        final booking_data = booking_snapshot.data();
        final booking = Booking.fromJson(booking_data, doc_booking);
        bookingsList.add(booking);
      }
      return right(bookingsList);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getPatientNames(
      List<Booking> bookings) async {
    List<String> NamesList = [];
    try {
      for (Booking booking in bookings) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('info_Patients')
            .doc(booking.Patient_id)
            .get();
        String patient_name = documentSnapshot.get('Name');
        NamesList.add(patient_name);
      }
      return right(NamesList);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

  Future<Either<Failure, void>> moveToPrevAppoints(Booking booking) async {
    try {
      DocumentReference bookingReference = await FirebaseFirestore.instance
          .collection('Bookings')
          .doc(booking.id);
      bookingReference.update({
        'State': booking.State,
      });

      DocumentReference doctorReference = await FirebaseFirestore.instance
          .collection('info_Doctors')
          .doc(booking.Doctor_id);

      doctorReference.update({
        'Previous_Appointments': FieldValue.arrayUnion([booking.id]),
      });

      doctorReference.update({
        'Bookings': FieldValue.arrayRemove([booking.id]),
      });

      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}
