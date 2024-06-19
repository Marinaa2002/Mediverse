// Define a model class for Appointment
import 'dart:convert';

class SlotsModel {
  final String dUid;
  final String hospitalName;
  final String isoDate;
  final List<dynamic> timeSlots;
  final String date;
  final String day;
  final int year;

  SlotsModel({
    required this.dUid,
    required this.hospitalName,
    required this.timeSlots,
    required this.date,
    required this.day,
    required this.year,
    required this.isoDate,
  });

  // Factory method to create an Appointment object from a Firestore document snapshot
  factory SlotsModel.fromJson(jsonData) {
    return SlotsModel(
        dUid: jsonData['D_uid'],
        hospitalName: jsonData['HospitalName'],
        timeSlots: jsonData['Time'],
        date: jsonData['Date'],
        day: jsonData['Day'],
        year: jsonData['year'],
        isoDate: jsonData['isoDate']);
  }
}
