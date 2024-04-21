import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/Bloc_Observer.dart';
import 'package:mediverse/Core/utils/api_keys.dart';
import 'package:mediverse/Features/Beginning/FormStaff/presentation/Manager/staff_request_cubit.dart';
import 'package:mediverse/Features/Beginning/FormStaff/presentation/views/FormStaff.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/data/repo/login_repo_impl.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/Manager/forgetPassword_cubit/forget_password_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/Manager/login_cubit/login_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:mediverse/Features/Beginning/RegisterChoice/RegisterChoiceScreen.dart';
import 'package:mediverse/Features/Beginning/SignUpDoctor/presentation/Manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:mediverse/Features/Beginning/SignUpDoctor/presentation/view/DoctorSignUp.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/presentation/Manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/presentation/view/PatientSignUp.dart';
import 'package:mediverse/Features/Beginning/splashScreen/splashScreen.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/CameraScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepoImpl.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientCubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/data/models/NoteModel.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Manager/AddNoteCubit.dart/add_note_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Manager/NotesCubit/NotesCubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Views/DrNotesScreen.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Views/Edit_View_Notes.dart';

import 'Features/PatientDashboard/MainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey = ApiKeys.publishableKey;
  await FirebaseAppCheck.instance.activate();
  await Hive.initFlutter();
  cameras = await availableCameras();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  // await Hive.openBox<NoteModel>(kNotesBox); // here hat5do
  runApp(MyApp());
}

final NotesCubit notesCubit = NotesCubit();
final AddNoteCubit addNoteCubit = AddNoteCubit();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ForgetPasswordCubit(LoginRepoImpl()),
                ),
                BlocProvider(
                  create: (context) => LoginCubit(LoginRepoImpl()),
                ),
              ],
              child: LoginScreen(),
            ),
        '/registerChoice': (context) => RegisterChoice(),
        '/formStaff': (context) => BlocProvider(
              create: (context) => StaffRequestCubit(),
              child: FormStaff(),
            ),
        '/signUpDoctor': (context) => BlocProvider(
              create: (context) => SignUpDocCubit(),
              child: DoctorSignUpScreen(),
            ),
        '/signUpPatient': (context) => BlocProvider(
              create: (context) => SignUpCubit(),
              child: PatientSignUpScreen(),
            ),
        '/DrNotes': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: notesCubit,
                ),
                BlocProvider.value(
                  value: addNoteCubit,
                ),
              ],
              child: DrNotesScreen(),
            ),
        kCameraScrenId: (context) => const CameraScreen(),
        '/mainScreenPatient': (context) => BlocProvider(
              create: (context) =>
                  FetechPatientInfoCubit(GetPatientInfoRepoImpl()),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: MainScreenWidget(
                  id: currentUserId,
                ),
              ),
            ),
        // '/EditNoteView': (context) => BlocProvider(
        //       create: (context) => NotesCubit(),
        //       child: EditNoteView(
        //         note: NoteModel(
        //           title: 'title',
        //           subTitle: 'subTitle',
        //           date: '',
        //           color: 0,
        //         ),
        //       ),
        //     ),
      },
    );
  }
}
