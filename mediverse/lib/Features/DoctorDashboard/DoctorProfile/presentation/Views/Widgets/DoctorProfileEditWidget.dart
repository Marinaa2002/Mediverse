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

  var userData;
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

  DoctorProfileEditWidget({
    super.key,
    required this.userData
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
                              text: userData['Name'] ?? 'Name',
                              onChanged: (value) {
                                name = value;
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
                              text: userData['Age'] ?? 'Age',
                              onChanged: (value) {
                                age = value;
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
                              text: userData['Phone'] ?? 'Phone Number',
                              onChanged: (value) {
                                phoneNum = value;
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
                              text: userData['NationalId']?? "National ID",
                              onChanged: (value) {
                                national_id = value;
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
                              text: userData['Speciality'] ?? "Speciality",
                              onChanged: (value) {
                                speciality = value;
                              },
                              controller: specialityController,
                            ),
                          ),
                          DoctorProfileSaveButton(
                            text: "Save",
                            screen: null,
                            onPressed: () async {
                              if(nameController.text.isEmpty){
                                name = userData['Name'];
                              }
                              else{
                                await BlocProvider.of<DoctorProfileEditCubit>(context)
                                    .editName(name: name);
                              }
                              if(ageController.text.isEmpty){
                                age = userData['Age'];
                              }
                              else{
                                await BlocProvider.of<DoctorProfileEditCubit>(context)
                                    .editAge(age: age);
                              }
                              if(phoneNumController.text.isEmpty){
                                phoneNum = userData['Phone'];
                              }
                              else{
                                await BlocProvider.of<DoctorProfileEditCubit>(context)
                                    .editPhoneNum(phoneNum: phoneNum);
                              }
                              if(natIDController.text.isEmpty){
                                national_id = userData['NationalId'];
                              }
                              else{
                                await BlocProvider.of<DoctorProfileEditCubit>(context)
                                    .editNationalId(nationalId: national_id);
                              }
                              if(specialityController.text.isEmpty){
                                speciality = userData['Speciality'];
                              }
                              else{
                                await BlocProvider.of<DoctorProfileEditCubit>(context)
                                    .editSpeciality(speciality: speciality);
                              }
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