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
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Core/utils/api_keys.dart';
import 'package:mediverse/Core/utils/serviceLocator.dart';
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
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/repos/getDoctorInfoRepoImp.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoCubit.dart';
import 'package:mediverse/Features/DoctorDashboard/MainScreenDoctor.dart';

import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/repos/patient_review_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/presentation/Manager/patient_review_cubit/patient_review_cubit.dart';

import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/CameraScreen.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/DoctorChat.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepoImpl.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientCubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/data/models/NoteModel.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Manager/AddNoteCubit.dart/add_note_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Manager/NotesCubit/NotesCubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Views/DrNotesScreen.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/repos/labResult_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Manager/lab_result_cubit/lab_result_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/LabResultsScreen.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/data/repos/medical_prescription_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Manager/medical_prescription_cubit/medical_prescription_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalRecordEditScreen/presentation/Manager/save_data_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/tabs/MedicalRecordTab/presentation/Manager/retr_data_cubit.dart';

import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/repos/ProfilePatientRepo_Impl.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Manager/profile_edit_cubit/profile_edit_cubit.dart';

import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/MedicalPrescriptionsScreen.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/FetechAdminInformationRepoImp.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/FetechAdminInfoCubit.dart/fetech_admin_info_cubit.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Views/AdminMainScreen.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/HospitalStaffManagementScreen.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/data/repos/FetechHMInformationRepoImpl.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/presentation/Manager/FetechHospitalMangementCubit/fetech_HM_info_cubit.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/presentation/Views/HospitalStaffManagementScreenAddDoctors.dart';
import 'package:mediverse/Features/StaffDashboard/LabStaffMainScreen/presentation/LabResultPatientStaffPortal.dart';
import 'package:mediverse/Features/StaffDashboard/LabStaffMainScreen/presentation/LabStaffMainScreen.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalMangmentAddDoctorsBody.dart';

import 'Features/DoctorDashboard/DoctorProfile/data/repos/DoctorProfileRepoImpl.dart';
import 'Features/DoctorDashboard/DoctorProfile/presentation/Manager/Doctor_profile_edit_cubit/doctor_profile_edit_cubit.dart';
import 'Features/PatientDashboard/MainScreen.dart';
import 'Features/StaffDashboard/AdminProfileScreen/data/Repos/AdminProfileRepoImpl.dart';
import 'Features/StaffDashboard/AdminProfileScreen/presentation/Manager/Admin_Profile_Edit_Cubit/admin_profile_edit_cubit.dart';
import 'Features/StaffDashboard/StaffProfileScreen/data/repos/StaffProfileRepoImpl.dart';
import 'Features/StaffDashboard/StaffProfileScreen/presentation/Manager/staff_profile_edit_cubit.dart';

void main() async {
  setupIDServiceLocator();
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
final StaffRequestCubit staffRequestCubit = StaffRequestCubit();
final SignUpCubit signUpCubit = SignUpCubit();
final SignUpDocCubit signUpDocCubit = SignUpDocCubit();
var loginRepoImpl = LoginRepoImpl();
final LoginCubit loginCubit = LoginCubit(loginRepoImpl);
final ForgetPasswordCubit forgetPasswordCubit =
    ForgetPasswordCubit(loginRepoImpl);
final FetechPatientInfoCubit fetechPatientInfoCubit =
    FetechPatientInfoCubit(GetPatientInfoRepoImpl());

final AddNoteCubit addNoteCubit = AddNoteCubit();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => SignUpDocCubit()),
        BlocProvider(create: (context) => StaffRequestCubit()),
        // BlocProvider(
        //   create: (context) =>
        //       PatientReviewCubit(PatientReviewRepoImpl())..getDoctorReviews(),
        // ),
        BlocProvider(
          create: (context) => ProfileEditCubit(ProfilePatientRepoImpl()),
        ),
        BlocProvider(
          create: (context) => DoctorProfileEditCubit(DoctorProfileRepoImpl()),
        ),
        BlocProvider(
          create: (context) => AdminProfileEditCubit(AdminProfileRepoImpl()),
        ),
        BlocProvider(
          create: (context) => StaffProfileEditCubit(StaffProfileRepoImpl()),
        ),
        BlocProvider(create: (context) => ForgetPasswordCubit(LoginRepoImpl())),
        BlocProvider(create: (context) => LoginCubit(LoginRepoImpl())),
        // BlocProvider(
        //   create: (context) =>
        //       LabResultCubit(LabResultRepoImpl()),
        // ),
        // BlocProvider(
        //   create: (context) =>
        //       MedicalPrescriptionCubit(MedicalPrescriptionRepoImpl())
        //         ,
        // ),
        BlocProvider(create: (context) => SaveDataCubit()),
        BlocProvider(
            create: (context) => RetrDataCubit()..RetrDataMedicalRec()),
        BlocProvider(
            create: ((context) =>
                FetechPatientInfoCubit((GetPatientInfoRepoImpl()))))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),

          '/registerChoice': (context) => RegisterChoice(),
          '/formStaff': (context) => FormStaff(),
          '/signUpDoctor': (context) => BlocProvider.value(
                value: signUpDocCubit,
                child: DoctorSignUpScreen(),
              ),
          '/signUpPatient': (context) => PatientSignUpScreen(),
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
          kCameraScrenId: (context) => CameraScreen(),
          '/mainScreenPatient': (context) => BlocProvider.value(
                value: fetechPatientInfoCubit,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: MainScreenWidget(),
                ),
              ),
          '/LabResultsScreen': (context) => BlocProvider(
                create: (context) => LabResultCubit(
                  LabResultRepoImpl(),
                ),
                child: LabResultsScreen(),
              ),
          '/MedicalPrescriptionsScreen': (context) => BlocProvider(
                create: (context) =>
                    MedicalPrescriptionCubit(MedicalPrescriptionRepoImpl()),
                child: MedicalPrescriptionsScreen(),
              ),
          '/AdminMainScreen': (context) => BlocProvider(
                create: (context) =>
                    FetechAdminInfoCubit(GetAdminInfoRepoImp()),
                child: AdminMainScreenWidget(),
              ),
          '/DoctorChat': (context) => BlocProvider(
                create: (context) => GetDoctorInfoCubit(GetDoctorInfoRepoImp()),
                child: DoctorChat(),
              ),
          '/HospitalStaffManagementScreenAddDoctors': (context) => BlocProvider(
                create: (context) => FetecHMInfoCubit(FetechHMRepoImp()),
                child: HospitalStaffManagementScreenAddDoctors(),
              ),
          '/LabStaffScreen': (context) => BlocProvider(
                create: (context) => FetecHMInfoCubit(FetechHMRepoImp()),
                child: LabStaffScreen(),
              ),
          '/mainScreenDoctor': (context) => BlocProvider(
                create: (context) => GetDoctorInfoCubit(GetDoctorInfoRepoImp()),
                child: MainScreenDoctor(),
              ),
          '/HospitalStaffManagementScreen': (context) => BlocProvider(
                create: (context) => GetDoctorInfoCubit(
                  GetDoctorInfoRepoImp(),
                ),
                child: HospitalStaffManagementScreen(),
              ),
          '/LabResultsScreenStaff': (context) => BlocProvider(
                create: (context) => LabResultCubit(
                  LabResultRepoImpl(),
                ),
                child: LabResultPatientStaffPortal(),
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
      ),
    );
  }
}
