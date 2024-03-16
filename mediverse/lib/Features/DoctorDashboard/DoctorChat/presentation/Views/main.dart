import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/DoctorChat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: DoctorChat(),
    );
  }
}
