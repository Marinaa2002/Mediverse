import 'dart:ffi';
import 'dart:io';

import 'package:mediverse/models/blog.dart';
import 'package:mediverse/models/booking.dart';
import 'package:mediverse/models/patient.dart';
import 'package:mediverse/models/review.dart';

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
    required this.Cost_H_booking,
    required this.Cost_C_booking,
    required this.Blogs,
    required this.Patients,
    required this.DocAppointments,
    required this.Bookings,
  });

  final String id;
  final String Name;
  final int Age;
  final String Phone;
  final String Email;
  final String National_id;
  final File profile_picture;
  final String State;
  final String Speciality;
  final String License_Number;
  final Float Rating;
  final List<Review> Reviews;
  final Map<String, String> Clinics; // <clinic name, hospital name or private>
  final int Cost_H_booking;
  final int Cost_C_booking;
  final List<Blog> Blogs;
  final List<Patient> Patients;
  final List<Booking> DocAppointments;
  final List<Booking> Bookings;
}
