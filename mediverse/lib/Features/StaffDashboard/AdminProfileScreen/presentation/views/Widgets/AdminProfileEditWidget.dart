import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/StaffDashboard/AdminProfileScreen/data/Models/AdminProfileModel.dart';
import '../../../../../../Constants/Themes.dart';
import '../../../../../../Constants/constant.dart';
import '../../Manager/Admin_Profile_Edit_Cubit/admin_profile_edit_cubit.dart';
import 'AdminProfileEditTextFormField.dart';
import 'AdminProfileSaveButton.dart';


class AdminProfileEditWidget extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  var userData;
  final currentUser = FirebaseAuth.instance.currentUser;

  CollectionReference details =
  FirebaseFirestore.instance.collection('Admins');
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  String? name;
  String? email;
  String? phoneNum;
  bool isLoading = false;

  AdminProfileEditWidget({
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
        body: BlocBuilder<AdminProfileEditCubit, AdminProfileEditState>(
          builder: (context, state) {
            if(state is AdminProfileEditLoading) {
              return CircularProgressIndicator();
            }else if (state is AdminProfileEditFailure) {
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
                            child: AdminProfileTextFormField(
                              text: userData['Name'],
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
                              child: Text('Change Your Phone Number:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12, 0, 12, 20),
                            child: AdminProfileTextFormField(
                              text: userData['Phone'],
                              onChanged: (value) {
                                phoneNum = value;
                              },
                              controller: phoneNumController,
                            ),
                          ),
                          // Align(
                          //   alignment: const AlignmentDirectional(-1, -1),
                          //   child: Padding(
                          //     padding: const EdgeInsetsDirectional.fromSTEB(
                          //         15, 5, 0, 10),
                          //     child: Text('Change Your Email:',
                          //         style: Themes.titleButton),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(
                          //       12, 0, 12, 10),
                          //   child: AdminProfileTextFormField(
                          //     text: "Email",
                          //     onChanged: (value) {
                          //       email = value;
                          //       BlocProvider.of<AdminProfileEditCubit>(context)
                          //       .editEmail(email: email);
                          //     },
                          //     controller: emailController,
                          //   ),
                          // ),
                          AdminProfileSaveButton(
                            text: "Save",
                            screen: null,
                            onPressed: () async {
                              if(nameController.text.isEmpty){
                                name = userData['Name'];
                              }
                              else{
                                await BlocProvider.of<AdminProfileEditCubit>(context)
                                    .editName(name: name);
                              }
                              if(phoneNumController.text.isEmpty){
                                phoneNum = userData['Phone'];
                              }
                              else{
                                await BlocProvider.of<AdminProfileEditCubit>(context)
                                    .editPhoneNum(phoneNum: phoneNum);
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