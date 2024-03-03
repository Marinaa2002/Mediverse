import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/LabResultsScreen.dart';

import '../../data/repos/labResult_repo_impl.dart';
import '../Manager/lab_result_cubit/lab_result_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LabResultCubit(
            LabResultRepoImpl())..getLabModels(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LabResultsScreen.id: (context) => LabResultsScreen()
        },
        initialRoute: LabResultsScreen.id,
      ),
    );
  }
}
