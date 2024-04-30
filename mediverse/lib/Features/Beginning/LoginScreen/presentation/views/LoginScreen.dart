import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/WaitingScreen.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/ForgetPasswordWidget.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/LoginButtonWidget.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/LogoContWidget.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/TextFormFieldPassWidget.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/TextFormFieldWidget.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/startingContWidget.dart';
import 'package:mediverse/Features/DoctorDashboard/MainScreenDoctor.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepoImpl.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientCubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/data/models/NoteModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/presentation/Views/HospitalStaffManagementScreenAddDoctors.dart';
import 'package:mediverse/Features/StaffDashboard/LabStaffMainScreen/presentation/LabStaffMainScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../Constants/Themes.dart';
import '../../../../../GlobalWidgets/titleText.dart';
import '../Manager/login_cubit/login_cubit.dart';

bool isLoading = false;

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();

  static String id = 'LoginPage';

  String? email;
  String? password;
  TextEditingController forgetPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: SpinKitSpinningCircle(
        color: kprimaryColor,
        size: 50,
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          String type = '', documentid = '', status = '';
          if (state is LoginLoading) {
            isLoading = true;
          } else if (state is LoginSuccess) {
            CollectionReference metaData =
                FirebaseFirestore.instance.collection('MetaData');
            QuerySnapshot querySnapshot =
                await metaData.where('email', isEqualTo: email).limit(1).get();
            // If document(s) found, return the ID of the first one
            if (querySnapshot.docs.isNotEmpty) {
              DocumentSnapshot firstDocument = querySnapshot.docs.first;
              Map<String, dynamic> documentData =
                  firstDocument.data() as Map<String, dynamic>;
              documentid = querySnapshot.docs.first.id;
              type = documentData['type'];
              globalcurrentUserId = documentid;
              // status=documentData['status']; // Change 'type' to the actual field name} else {
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WaitingForApprovalScreen(),
                  ));
            }
            if (type == 'Patient') {
              kNotesBox = documentid;
              await Hive.openBox<NoteModel>(kNotesBox);
              // Navigator.of(context)
              //     .pushNamed('/LabResultsScreen', arguments: {
              //   "labresult_id": "A",
              // });
              // Navigator.of(context).pushNamed('/DrNotes');
              Navigator.pushReplacementNamed(context, '/mainScreenPatient');
            } else if (type == 'Doctor') {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) =>
                          FetechPatientInfoCubit(GetPatientInfoRepoImpl()),
                      child: MainScreenDoctor(),
                    ),
                  ));
            } else if (type == 'Lab Staff') {
              Navigator.pushReplacementNamed(context, '/LabStaffScreen',
                  arguments: {'id': globalcurrentUserId},);
            } else if (type == 'Hospital Staff') {
              Navigator.pushReplacementNamed(
                  context, '/HospitalStaffManagementScreenAddDoctors',
                  arguments: {'id': globalcurrentUserId});
            } else if (type == 'admin') {
              Navigator.pushReplacementNamed(context, '/AdminMainScreen');
            }
            isLoading = false;
          } else if (state is LoginFailure) {
            isLoading = false;
            print(state.errMessage);
            showSnackbar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return Loading();
          }
          return Scaffold(
            body: Form(
              key: formKey,
              child: Stack(
                children: [
                  const startingContWidget(),
                  SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const LogoContWidget(),
                      const titleText(
                        text: "Login",
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child:
                              Text('Welcome Back', style: Themes.bigHeadline),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, -1),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15, 40, 0, 20),
                          child: Text('Please Enter Your Email',
                              style: Themes.titleButton),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 15),
                        child: TextFormFieldWidget(
                          text: "Email",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is required';
                            } else if (!value.contains('@')) {
                              return 'Formatted Email is required';
                            }
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          controller: forgetPassController,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, -1),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15, 5, 0, 20),
                          child: Text('Please Enter Your Password',
                              style: Themes.titleButton),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 8),
                        child: TextFormFieldPassWidget(
                          text: "Password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is required';
                            }
                          },
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                      LoginButtonWidget(
                        text: "Login",
                        screen: null,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            log(email!);
                            BlocProvider.of<LoginCubit>(context)
                                .loginUser(email: email!, password: password!);
                          } else {}
                        },
                      ),
                      ForgetPasswordWidget(
                        forgetPassController: forgetPassController,
                        isLoad: isLoading,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: Themes.verySmallText,
                                ),
                                TextSpan(
                                  text: ' Sign Up here',
                                  style: Themes.labelColored,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .pushNamed('/registerChoice');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
