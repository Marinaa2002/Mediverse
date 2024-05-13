import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Manager/profile_edit_cubit/profile_edit_cubit.dart';

import '../../../../../../Constants/Themes.dart';
import '../../../../../../Constants/constant.dart';
import 'ProfileEditTextFormField.dart';
import 'ProfileSaveButton.dart';

class ProfileEditWidget extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  final currentUser = FirebaseAuth.instance.currentUser;

  CollectionReference details =
  FirebaseFirestore.instance.collection('info_Patients');
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController natIDController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? name;
  String? age;
  String? national_id;
  String? phoneNum;
  String? email;
  bool isLoading = false;
  var userData;
  User? user = FirebaseAuth.instance.currentUser;

  ProfileEditWidget({
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
        body: BlocBuilder<ProfileEditCubit, ProfileEditState>(
          builder: (context, state) {
            if(state is ProfileEditLoading) {
              return CircularProgressIndicator();
            }else if (state is ProfileEditFailure) {
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
                            child: ProfileTextFormField(
                              text:  userData['Name'] ?? 'Name',
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
                            child: ProfileTextFormField(
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
                            child: ProfileTextFormField(
                              text: userData['Phone Number'] ?? 'Phone Number',
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
                            child: ProfileTextFormField(
                              text: userData['NationalId'] ?? 'NationalId',
                              onChanged: (value) {
                                national_id = value;
                              },
                              controller: natIDController,
                            ),
                          ),


                          // Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(
                          //       12, 0, 12, 10),
                          //   child: ProfileTextFormField(
                          //     text: userData['Email'] ?? 'Email',
                          //     onChanged: (value) async{
                          //       email = value;
                          //
                          //       // BlocProvider.of<ProfileEditCubit>(context)
                          //       //     .editNationalId(nationalId: national_id);
                          //     },
                          //     controller: emailController,
                          //   ),
                          // ),


                          ProfileSaveButton(
                            text: "Save",
                            screen: null,
                            onPressed: () async {
                              if(nameController.text.isEmpty){
                                name = userData['Name'];
                              }
                              else{
                                BlocProvider.of<ProfileEditCubit>(context)
                                    .editName(name: name);
                              }
                              if(ageController.text.isEmpty){
                                age = userData['Age'];
                              }
                              else{
                                BlocProvider.of<ProfileEditCubit>(context)
                                    .editAge(age: age);
                              }
                              if(phoneNumController.text.isEmpty){
                                phoneNum = userData['Phone Number'];
                              }
                              else{
                                BlocProvider.of<ProfileEditCubit>(context)
                                    .editPhoneNum(phoneNum: phoneNum);
                              }
                              if(natIDController.text.isEmpty){
                                national_id = userData['NationalId'];
                              }
                              else{
                                BlocProvider.of<ProfileEditCubit>(context)
                                    .editNationalId(nationalId: national_id);
                              }
                              Navigator.pop(context);
                              // String newEmail = emailController.text.trim();
                              // try {
                              //   // Update the email for the current user
                              //   await FirebaseAuth.instance.currentUser?.updateEmail(newEmail);
                              //
                              //   // If successful, navigate back or show a success message
                              //   Navigator.pop(context); // Navigate back
                              // } catch (e) {
                              //   // Handle errors, such as invalid email format or email already in use
                              //   print("Error updating email: $e");
                              //   // You can display an error message to the user if needed
                              // }
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