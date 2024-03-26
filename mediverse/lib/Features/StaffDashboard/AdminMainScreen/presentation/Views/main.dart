import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mediverse/Core/utils/api_keys.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Views/AdminMainScreen.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/HospitalStaffManagementScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey = ApiKeys.publishableKey;
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
        colorScheme: ColorScheme.fromSeed(seedColor:kprima),
      ),
      home: AdminMainScreenWidget(),
    );
  }
}
