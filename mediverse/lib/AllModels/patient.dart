import 'dart:convert';

import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/AllModels/doctor.dart';

class Patient {
  const Patient({
    required this.id,
    required this.Name,
    required this.Age,
    required this.Phone,
    required this.Email,
    required this.National_id,
    required this.profile_picture,
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
  final String profile_picture;
  final Map<String, dynamic> Medical_Record;
  final List<dynamic> Prescriptions;
  final List<dynamic> Lab_Results;
  final List<dynamic> Doctor_Notes;
  final List<dynamic> Doctors; // List of doctors previously visited
  final List<dynamic> Bookings;

  factory Patient.fromJson(Map<String, dynamic> json) {
    // Parse the json data
    return Patient(
      id: json['id'],
      Name: json['Name'],
      Age: json['Age'],
      Phone: json['Phone'],
      Email: json['Email'],
      National_id: json['National_id'],
      profile_picture:
          json['profile_picture'], // Assuming profile_picture is a file path
      Medical_Record: Map<String, String>.from(json['Medical_Record']),
      Prescriptions: List<Map<String, String>>.from(json['Prescriptions']),
      Lab_Results: List<Map<String, String>>.from(json['Lab_Results']),
      Doctor_Notes: List<Map<String, String>>.from(json['Doctor_Notes']),
      Doctors: List<String>.from(json['Doctors']),
      Bookings: (json['Bookings'] as List<dynamic>)
          .map((bookingJson) => Booking.fromJson(bookingJson))
          .toList(),
    );
  }
}
