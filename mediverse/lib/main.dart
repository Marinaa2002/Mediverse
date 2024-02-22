import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'package:mediverse/screens/DoctorDashboard/BookingDoctor.dart';
import 'package:mediverse/screens/DoctorDashboard/DoctorChat.dart';
import 'package:mediverse/screens/DoctorDashboard/MainScreen2.dart';
import 'package:mediverse/screens/DoctorDashboard/PatientHistoryScreen.dart';
import 'package:mediverse/screens/DoctorDashboard/widgets/BookingCard.dart';

import 'package:mediverse/Screens/StaffDashboard/HospitalStaffManagementScreen.dart';
import 'package:mediverse/Screens/StaffDashboard/HospitalStaffManagementScreenAddDoctors.dart';

import 'package:mediverse/Screens/StaffDashboard/LabStaffMainScreen.dart';


import 'package:mediverse/Screens/PatientDashboard/MainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainScreen2(),

    );
  }
}
