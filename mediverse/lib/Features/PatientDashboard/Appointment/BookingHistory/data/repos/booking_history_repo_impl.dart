import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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

  @override
  Future<Either<Failure, void>> deleteBooking(Booking booking) async {
    try {
      DocumentReference bookingReference = await FirebaseFirestore.instance
          .collection('Bookings')
          .doc(booking.id);
      bookingReference.delete();

      DocumentReference patientReference = await FirebaseFirestore.instance
          .collection('info_Patients')
          .doc(booking.Patient_id);

      patientReference.update({
        'Bookings': FieldValue.arrayRemove([booking.id]),
      });

      DocumentReference doctorReference = await FirebaseFirestore.instance
          .collection('info_Doctors')
          .doc(booking.Doctor_id);

      doctorReference.update({
        'Bookings': FieldValue.arrayRemove([booking.id]),
      });

      DocumentSnapshot doctorSnapshot = await doctorReference.get();

      //get clinic index
      List<dynamic> clinics = doctorSnapshot.get('Clinics');
      int clinicIndex =
          clinics.indexWhere((element) => element['name'] == booking.Location);

      List<dynamic> slots = doctorSnapshot.get('Slots');

      //get date index
      List<dynamic> timeSlots = slots[clinicIndex]['Time Slots'];
      int dateIndex =
          timeSlots.indexWhere((element) => element['Date'] == booking.Date);

      //get time index
      List<dynamic> Time = timeSlots[dateIndex]['Time'];
      int timeIndex = Time.indexWhere((element) => element == booking.Time);

      //change slot status from booked to free
      slots[clinicIndex]['Time Slots'][dateIndex]['Status'][timeIndex] = 'free';

      //update Slots field
      await doctorReference.update({
        'Slots': slots,
      });

      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}
