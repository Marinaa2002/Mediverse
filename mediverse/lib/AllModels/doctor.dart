import 'dart:ffi';
import 'dart:io';

import 'package:mediverse/AllModels/blog.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/AllModels/patient.dart';
import 'package:mediverse/AllModels/review.dart';

class Doctor {
  const Doctor({
    required this.id,
    required this.Name,
    required this.Age,
    required this.Phone,
    required this.Email,
    required this.National_id,
    required this.profile_picture,
    required this.State,
    required this.Speciality,
    required this.License_Number,
    required this.Rating,
    required this.Reviews,
    required this.Clinics,
    required this.Slots,
    required this.Blogs,
    required this.Patients,
    required this.Prev_Appointments,
    required this.Bookings,
  });

  final String id;
  final String Name;
  final String Age;
  final String Phone;
  final String Email;
  final String National_id;
  final String profile_picture;
  final String State;
  final String Speciality;
  final String License_Number;
  final double Rating;
  final List<dynamic> Reviews;
  final List<dynamic> Clinics; // <clinic name, hospital name or private>
  final List<dynamic> Slots;
  final List<dynamic> Blogs;
  final List<dynamic> Patients;
  final List<dynamic> Prev_Appointments;
  final List<dynamic> Bookings;
}
