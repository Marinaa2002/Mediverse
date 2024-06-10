import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoCubit.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoStates.dart';

import '../../PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';

class AppBarDoctor extends StatelessWidget {
  const AppBarDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("DoctorProfile")
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
          PatientProfileModel profileModel =
              PatientProfileModel.fromJson(snapshot.data!.data());
          return Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 20, 5),
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      color: kprimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Hero(
                        tag: 'profile',
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.2,
                          height: MediaQuery.of(context).size.width*0.2,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            profileModel.profilePicture,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(70, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        profileModel.name,
                        style:
                        TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        profileModel.email,
                        style:
                        TextStyle(
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
  }
}
