import 'package:flutter/material.dart';

import 'package:mediverse/screens/DoctorDashboard/BookingDoctor.dart';
import 'package:mediverse/screens/DoctorDashboard/DoctorChat.dart';
import 'package:mediverse/screens/DoctorDashboard/MainScreen2.dart';
import 'package:mediverse/screens/DoctorDashboard/PatientHistoryScreen.dart';
import 'package:mediverse/screens/DoctorDashboard/widgets/BookingCard.dart';

import 'package:mediverse/Screens/StaffDashboard/HospitalStaffManagementScreen.dart';
import 'package:mediverse/Screens/StaffDashboard/HospitalStaffManagementScreenAddDoctors.dart';

import 'package:mediverse/Screens/StaffDashboard/LabStaffMainScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen2(),

    );
  }
}
