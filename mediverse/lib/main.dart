import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mediverse/Core/utils/api_keys.dart';
import 'package:mediverse/Features/Beginning/FormStaff/presentation/Manager/staff_request_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/data/repo/login_repo_impl.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/Manager/forgetPassword_cubit/forget_password_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/Manager/login_cubit/login_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:mediverse/Features/Beginning/SignUpDoctor/presentation/Manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/presentation/Manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:mediverse/Features/Beginning/splashScreen/splashScreen.dart';
import 'package:mediverse/Features/PatientDashboard/MainScreen.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/repos/labResult_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Manager/lab_result_cubit/lab_result_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/data/repos/medical_prescription_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Manager/medical_prescription_cubit/medical_prescription_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalRecordEditScreen/presentation/Manager/save_data_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/tabs/MedicalRecordTab/presentation/Manager/retr_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => SignUpDocCubit()),
        BlocProvider(create: (context) => StaffRequestCubit()),
        BlocProvider(create: (context) => ForgetPasswordCubit(LoginRepoImpl())),
        BlocProvider(create: (context) => LoginCubit(LoginRepoImpl())),
        BlocProvider(
          create: (context) => LabResultCubit(LabResultRepoImpl())..getLabModels(),
        ),
        BlocProvider(
          create: (context) => MedicalPrescriptionCubit(MedicalPrescriptionRepoImpl())..getLabModels(),
        ),
        BlocProvider(create: (context) => SaveDataCubit()),
        BlocProvider(create: (context) => RetrDataCubit()..RetrDataMedicalRec()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
