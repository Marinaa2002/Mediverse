import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/DoctorDashboard/BookingDoctor/data/repos/doc_bookings_repo.dart';

class DocBookingsRepoImpl extends DocBookingsRepo {
  @override
  Future<Either<Failure, List<Booking>>> getAppointments(
      String doctor_id) async {
    List<Booking> appointmentsList = [];
    try {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('info_Doctors').doc(doctor_id);
      DocumentSnapshot documentSnapshot = await documentReference.get();
      var doctor_appointments = documentSnapshot.get('Previous_Appointments');
      for (var doc_appointment in doctor_appointments) {
        DocumentSnapshot appointment_snapshot = await FirebaseFirestore.instance
            .collection('Bookings')
            .doc(doc_appointment)
            .get();
        final appointment_data = appointment_snapshot.data();
        final appointment = Booking.fromJson(appointment_data, doc_appointment);
        appointmentsList.add(appointment);
      }
      return right(appointmentsList);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getPatientNames(
      List<Booking> appointments) async {
    List<String> NamesList = [];
    try {
      for (Booking appointment in appointments) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('info_Patients')
            .doc(appointment.Patient_id)
            .get();
        String patient_name = documentSnapshot.get('Name');
        NamesList.add(patient_name);
      }
      return right(NamesList);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}
