import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/ForgetPasswordWidget.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/LoginButtonWidget.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/LogoContWidget.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/TextFormFieldPassWidget.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/TextFormFieldWidget.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/widgets/startingContWidget.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepoImpl.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientCubit.dart';
import 'package:mediverse/Features/PatientDashboard/MainScreen.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Manager/NotesCubit/NotesCubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/repos/labResult_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Manager/lab_result_cubit/lab_result_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/data/repos/medical_prescription_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Manager/medical_prescription_cubit/medical_prescription_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../Constants/Themes.dart';
import '../../../../../GlobalWidgets/titleText.dart';
import '../../../RegisterChoice/RegisterChoiceScreen.dart';
import '../Manager/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();

  static String id = 'LoginPage';
  String? email;

  String? password;
  bool isLoading = false;
  TextEditingController forgetPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => NotesCubit(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          FetechPatientInfoCubit(GetPatientInfoRepoImpl()),
                    ),
                    BlocProvider(
                      create: (context) => LabResultCubit(LabResultRepoImpl()),
                    ),
                    BlocProvider(
                        create: (context) => MedicalPrescriptionCubit(
                            MedicalPrescriptionRepoImpl())),
                  ],
                  child: MainScreenWidget(
                    email: email!,
                  ),
                ),
              ));
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          print(state.errMessage);
          showSnackbar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
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
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterChoice(),
                                        ),
                                      );
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
          ),
        );
      },
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
