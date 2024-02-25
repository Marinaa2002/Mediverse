import 'dart:io';

import 'package:mediverse/models/booking.dart';
import 'package:mediverse/models/doctor.dart';

class Patient {
  const Patient({
    required this.id,
    required this.Name,
    required this.Age,
    required this.Phone,
    required this.Email,
    required this.National_id,
    required this.profile_picture,
    required this.State,
    required this.Medical_Record,
    required this.Prescriptions,
    required this.Lab_Results,
    required this.Doctor_Notes,
    required this.Doctors,
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
  final Map<String, String> Medical_Record;
  final List<String> Prescriptions;
  final List<String> Lab_Results;
  final List<String> Doctor_Notes;
  final List<Doctor> Doctors; //list of doctors previously visited
  final List<Booking> Bookings;
}
