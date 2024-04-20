import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/Bloc_Observer.dart';
import 'package:mediverse/Core/utils/api_keys.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/CameraScreen.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/data/models/NoteModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/HospitalStaffManagementScreen.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applfication.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HospitalStaffManagementScreen(),
    );
  }
}
