import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorProfile/presentation/Manager/Doctor_profile_edit_cubit/doctor_profile_edit_cubit.dart';

import '../../../../../../Constants/Themes.dart';
import '../../../../../../Constants/constant.dart';
import 'DoctorProfileEditTextFormField.dart';
import 'DoctorProfileSaveButton.dart';


class DoctorProfileEditWidget extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  final currentUser = FirebaseAuth.instance.currentUser;

  CollectionReference details =
  FirebaseFirestore.instance.collection('info_Patients');
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController natIDController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController specialityController = TextEditingController();
  String? name;
  String? age;
  String? national_id;
  String? phoneNum;
  String? speciality;
  bool isLoading = false;

  //PatientProfileModel? patientProfileModel;
  //var userData;
  DoctorProfileEditWidget({
    super.key,
    //required this.userData
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: kSecondryBackgroundColor,
              size: 24,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Edit Profile',
            style: Themes.headlineMedium.copyWith(
              color: backgroundColor,
              fontSize: 22,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: BlocBuilder<DoctorProfileEditCubit, DoctorProfileEditState>(
            builder: (context, state) {
              if(state is DoctorProfileEditLoading) {
                return CircularProgressIndicator();
              }else if (state is DoctorProfileEditFailure) {
                return Text('Try again');
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 20, 0, 10),
                              child: Text('Change Your name:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12, 0, 12, 20),
                            child: DoctorProfileTextFormField(
                              text: "Name",
                              onChanged: (value) {
                                name = value;
                                BlocProvider.of<DoctorProfileEditCubit>(context)
                                    .editName(name: name);
                              },
                              controller: nameController,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 5, 0, 10),
                              child: Text('Change Your Age:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12, 0, 12, 20),
                            child: DoctorProfileTextFormField(
                              text: "Age",
                              onChanged: (value) {
                                age = value;
                                BlocProvider.of<DoctorProfileEditCubit>(context)
                                    .editAge(age: age);
                              },
                              controller: ageController,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 5, 0, 10),
                              child: Text('Change Your Phone Number:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12, 0, 12, 20),
                            child: DoctorProfileTextFormField(
                              text: "Phone Number",
                              onChanged: (value) {
                                phoneNum = value;
                                BlocProvider.of<DoctorProfileEditCubit>(context)
                                    .editPhoneNum(phoneNum: phoneNum);
                              },
                              controller: phoneNumController,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 5, 0, 10),
                              child: Text('Change Your National ID:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12, 0, 12, 10),
                            child: DoctorProfileTextFormField(
                              text: "National ID",
                              onChanged: (value) {
                                national_id = value;
                                BlocProvider.of<DoctorProfileEditCubit>(context)
                                    .editNationalId(nationalId: national_id);
                              },
                              controller: natIDController,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 10, 0, 10),
                              child: Text('Change Your Speciality:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12, 0, 12, 10),
                            child: DoctorProfileTextFormField(
                              text: "Speciality",
                              onChanged: (value) {
                                speciality = value;
                                BlocProvider.of<DoctorProfileEditCubit>(context)
                                .editSpeciality(speciality: speciality);
                              },
                              controller: specialityController,
                            ),
                          ),
                          DoctorProfileSaveButton(
                            text: "Save",
                            screen: null,
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }
        )
    );
  }
}