import 'package:flutter/material.dart';
import 'package:mediverse/Screens/DoctorDashboard/PatientHistoryScreen.dart';
import 'package:mediverse/screens/DoctorDashboard/ChatsList.dart';
import 'package:mediverse/screens/DoctorDashboard/DoctorProfile.dart';
import 'package:mediverse/screens/DoctorDashboard/ViewMedicalHistory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorProfile(),
    );
  }

}