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
          .doc('GCdsPwoGDUp36lOBGJUJ')
          .get();

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      Doctor dummydoc = Doctor(
        id: 'GCdsPwoGDUp36lOBGJUJ',
        Name: data['Name'],
        Age: data['Age'],
        Phone: data['Phone'],
        Email: data['Email'],
        National_id: data['NationalId'],
        profile_picture: data['Profile_Picture'],
        State: data['State'],
        Speciality: data['Speciality'],
        License_Number: data['License_Number'],
        Rating: data['Rating'],
        Reviews: data['Reviews'],
        Clinics: data['Clinics'],
        Slots: data['Slots'],
        Blogs: data['Blogs'],
        Patients: data['Patients'],
        Prev_Appointments: data['Previous_Appointments'],
        Bookings: data['Bookings'],
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
