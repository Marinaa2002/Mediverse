import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediverse/AllModels/patient.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientCubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientState.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/PatientProfileScreen.dart';

import '../../../Constants/constant.dart';

class CustomAppbarMainScreenPatient extends StatelessWidget {
  const CustomAppbarMainScreenPatient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetechPatientInfoCubit, FetechPatientInfoState>(
      builder: (context, state) {
        if (state is FetechPatientInfoStateSuccess) {
          return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("info_Patients")
                  .doc(globalcurrentUserId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: SpinKitSpinningCircle(
                    color: kprimaryColor,
                    size: 50,
                  )); // Show a loading indicator while waiting for data
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } //
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('No Doctor available'),
                  ); // Show a loading indicator while waiting for data
                }
                PatientProfileModel profileModel = PatientProfileModel.fromJson(
                    snapshot.data!.data()); //5aif a3ml edit bs hwa doctor
                return Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientProfileScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: kprimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: Container(
                                width: 50,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  profileModel.profilePicture ??
                                      'assets/images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              profileModel.name,
                              style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              profileModel.email,
                              style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        } else if (state is FetechPatientInfoStateFailure) {
          log(state.errMsg);
          return Container(
            child: Text(state.errMsg),
          );
        }
        return Container();
      },
    );
  }
}
