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
  final String Age;
  final String Phone;
  final String Email;
  final String National_id;
  final String profile_picture;
  final List<dynamic> Medical_Record;
  final List<dynamic> Prescriptions;
  final List<dynamic> Lab_Results;
  final List<dynamic> Doctor_Notes;
  final List<dynamic> Doctors; // List of doctors previously visited
  final List<dynamic> Bookings;

  factory Patient.fromJson(Map<String, dynamic> json, String id) {
    // Parse the json data
    return Patient(
      id: id,
      Name: json['Name'],
      Age: json['Age'],
      Phone: json['Phone Number'],
      Email: json['Email'],
      National_id: json['NationalId'],
      profile_picture: json['Profile Picture'] ??
          "https://firebasestorage.googleapis.com/v0/b/mediverse-app.appspot.com/o/images%2F1713801545087?alt=media&token=1df4504a-3c94-4641-a359-d4075ee2e60d"
              '', // Assuming profile_picture is a file path
      Medical_Record: List<dynamic>.from(json['Medical Records']),
      Prescriptions: List<Map<String, String>>.from(json['Medical Prescriptions']),
      Lab_Results: List<Map<String, String>>.from(json['Lab Results']),
      Doctor_Notes: List<Map<String, String>>.from(json['Doctor Notes']),
      Doctors: List<String>.from(json['Doctors']),
      Bookings: List<dynamic>.from(json['Bookings']),
    );
  }
}
