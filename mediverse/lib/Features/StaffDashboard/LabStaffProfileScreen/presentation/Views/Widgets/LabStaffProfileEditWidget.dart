import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorProfile/presentation/Manager/Doctor_profile_edit_cubit/doctor_profile_edit_cubit.dart';

import '../../../../../../Constants/Themes.dart';
import '../../../../../../Constants/constant.dart';
import '../../Manager/lab_staff_profile_edit_cubit.dart';
import 'LabStaffProfileEditTextFormField.dart';
import 'LabStaffProfileSaveButton.dart';


class LabStaffProfileEditWidget extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  final currentUser = FirebaseAuth.instance.currentUser;

  var userData;
  CollectionReference details =
  FirebaseFirestore.instance.collection('info_Patients');
  final TextEditingController orgNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController orgTypeController = TextEditingController();
  // final TextEditingController phoneNumController = TextEditingController();
  // final TextEditingController specialityController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? orgName;
  String? location;
  String? orgType;
  // String? phoneNum;
  // String? speciality;
  String? email;
  bool isLoading = false;

  LabStaffProfileEditWidget({
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
        body: BlocBuilder<LabStaffProfileEditCubit, LabStaffProfileEditState>(
            builder: (context, state) {
              if(state is LabStaffProfileEditLoading) {
                return CircularProgressIndicator();
              }else if (state is LabStaffProfileEditFailure) {
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
                              child: Text('Change Your Organization Name:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12, 0, 12, 20),
                            child: LabStaffProfileEditTextFormField(
                              text: userData['Org Name'] ?? 'Org Name',
                              onChanged: (value) {
                                orgName = value;
                              },
                              controller: orgNameController,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 5, 0, 10),
                              child: Text('Change Your Organization Type:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12, 0, 12, 20),
                            child: LabStaffProfileEditTextFormField(
                              text: userData['Org Type'] ?? 'Org Type',
                              onChanged: (value) {
                                orgType = value;
                              },
                              controller: orgTypeController,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 5, 0, 10),
                              child: Text('Change Your Location:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12, 0, 12, 10),
                            child: LabStaffProfileEditTextFormField(
                              text: userData['Location']?? "Location",
                              onChanged: (value) {
                                location = value;
                              },
                              controller: locationController,
                            ),
                          ),

                          LabStaffProfileSaveButton(
                            text: "Save",
                            screen: null,
                            onPressed: () async {
                              if(orgNameController.text.isEmpty){
                                orgName = userData['Org Name'];
                              }
                              else{
                                await BlocProvider.of<LabStaffProfileEditCubit>(context)
                                .editOrgName(orgName: orgName);
                              }
                              if(locationController.text.isEmpty){
                                location = userData['Location'];
                              }
                              else{
                                await BlocProvider.of<LabStaffProfileEditCubit>(context)
                                .editLocation(location: location);
                              }
                              if(orgTypeController.text.isEmpty){
                                orgType = userData['Org Type'];
                              }
                              else{
                                await BlocProvider.of<LabStaffProfileEditCubit>(context)
                                .editOrgType(orgType: orgType);
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