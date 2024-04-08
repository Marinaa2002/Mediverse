import 'package:mediverse/AllModels/ClinicsAppointment.dart';
import 'package:mediverse/AllModels/Slot.dart';

class Doctor {
  final String? name;
  final String? age;
  final String? phone;
  final List<String>? blogs;
  final List<String>? bookings;
  final String email;
  final String hospital;
  final String licenseNumber;
  final String nationalID;
  final List<String>? previousAppointments;
  final String? profilePicture;
  final double? rating;
  final List<String>? reviews;
  final List<Slot>? slots;
  final Map<String, ClinicAppointments>? clinicAppointments;
  final String? speciality;
  final String? state;

  Doctor({
    this.name,
    this.age,
    this.phone,
    this.blogs,
    this.bookings,
    required this.email,
    required this.hospital,
    required this.licenseNumber,
    required this.nationalID,
    this.previousAppointments,
    this.profilePicture,
    this.rating,
    this.reviews,
    this.slots,
    this.clinicAppointments,
    this.speciality,
    this.state,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['Name'],
      age: json['Age'],
      phone: json['Phone'],
      blogs: List<String>.from(json['Blogs'] ?? []),
      bookings: List<String>.from(json['Bookings'] ?? []),
      email: json['Email'],
      hospital: json['Hospital'],
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
      clinicAppointments:
          (json['Clinic-Appointments'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(
          key,
          ClinicAppointments.fromJson(value as Map<String, dynamic>),
        ),
      ),
      speciality: json['Speciality'],
      state: json['State'],
    );
  }
}
