import 'package:mediverse/AllModels/ClinicsAppointment.dart';
import 'package:mediverse/AllModels/Slot.dart';

class Doctor {
  final String id;
  final String name;
  final String? age;
  final String? phone;
  final List<dynamic>? blogs;
  final List<dynamic>? bookings;
  final String email;
  final String licenseNumber;
  final String nationalID;
  final List<dynamic>? previousAppointments;
  final String? profilePicture;
  final double? rating;
  final List<dynamic>? reviews;
  final List<dynamic>? slots;
  final List<dynamic> Clinics;
  final String speciality;
  final List<dynamic>? patients;
  final String? state;
  final String condition;



  Doctor(
      {required this.id,
      required this.name,
      this.age,
      this.phone,
      this.blogs,
      this.bookings,
      required this.email,
      required this.licenseNumber,
      required this.nationalID,
      this.previousAppointments,
      this.profilePicture,
      this.rating,
      this.reviews,
      this.slots,
      required this.Clinics,
      required this.speciality,
      this.patients,
      this.state,
      required this.condition});


  factory Doctor.fromJson(Map<String, dynamic> json, String doctorID) {
    return Doctor(
      id: doctorID,
      name: json['Name'],
      age: json['Age'],
      phone: json['Phone'],
      blogs: List<String>.from(json['Blogs'] ?? []),
      bookings: List<String>.from(json['Bookings'] ?? []),
      email: json['Email'],
      licenseNumber: json['License_Number'],
      nationalID: json['NationalId'],
      previousAppointments:
          List<String>.from(json['Previous_Appointments'] ?? []),
      profilePicture: json['Profile_Picture'],
      rating: json['Rating']?.toDouble(),
      reviews: List<String>.from(json['Reviews'] ?? []),
      slots: (json['Slots'] as List<dynamic>?)
          ?.map((slotJson) => Slot.fromJson(slotJson as Map<String, dynamic>))
          .toList(),
      Clinics: List<dynamic>.from(json['Clinics'] ?? []),
      speciality: json['Speciality'],
      state: json['State'],
      condition: json['Condition'],

    );
  }
}
