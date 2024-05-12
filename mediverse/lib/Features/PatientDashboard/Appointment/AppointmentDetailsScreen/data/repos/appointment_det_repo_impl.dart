import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/appointment_det_repo.dart';

class AppointmentDetailsRepoImpl implements AppointmentDetailsRepo {
  @override
  Future<Either<Failure, Doctor>> fetchDoctorInfo(String doctorID) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('info_Doctors')
          .doc(doctorID)
          .get();

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      Doctor dummydoc = Doctor(
        id: doctorID,
        name: data['Name'],
        age: data['Age'],
        phone: data['Phone'],
        email: data['Email'],
        nationalID: data['NationalId'],
        profilePicture: data['Profile_Picture'],
        state: data['State'],
        speciality: data['Speciality'],
        licenseNumber: data['License_Number'],
        rating: data['Rating'].toDouble(),
        reviews: data['Reviews'],
        Clinics: data['Clinics'],
        slots: data['Slots'],
        blogs: data['Blogs'],
        patients: data['Patients'],
        previousAppointments: data['Previous_Appointments'],
        bookings: data['Bookings'],
        condition: data['Condition'],
      );

      print(dummydoc);

      return right(dummydoc);
    } catch (e) {
      return left(
        ServerFailure(errMsg: 'couldn\'t find'),
      );
    }
  }
}
