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
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Patient_Profile") //to be change Patient Profile
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
              child: Text('No Patient available'),
            ); // Show a loading indicator while waiting for data
          }
          PatientProfileModel profileModel = PatientProfileModel.fromJson(
              snapshot.data!.data()); //5aif a3ml edit bs hwa doctor
          return
              // Align(
              // alignment: AlignmentDirectional(0, 0),
              // child: GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => PatientProfileScreen(),
              //       ),
              //     );
              //   },
              //   child:
            Row(
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
                        ));
                  },
                  child:
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
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.start, // Center vertically
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
                        style: const TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 14,
                          color: kThirdTextColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
              ],
            );
        });
  }
}

//   )
//   // Row(
//   //     mainAxisSize: MainAxisSize.max,
//   //     mainAxisAlignment: MainAxisAlignment.start,
//   //     crossAxisAlignment: CrossAxisAlignment.center,
//   //     children: [
//   //       Padding(
//   //         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
//   //         child: Container(
//   //           width: 50,
//   //           height: 50,
//   //           decoration: BoxDecoration(
//   //             color: kprimaryColor,
//   //             shape: BoxShape.circle,
//   //           ),
//   //           child: Padding(
//   //             padding: EdgeInsets.all(2),
//   //             child: Container(
//   //               width: 50,
//   //               height: 50,
//   //               clipBehavior: Clip.antiAlias,
//   //               decoration: BoxDecoration(
//   //                 shape: BoxShape.circle,
//   //               ),
//   //               child: Image.network(
//   //                 profileModel.profilePicture ??
//   //                     'assets/images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
//   //                 fit: BoxFit.fill,
//   //               ),
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //       SizedBox(
//   //         width: MediaQuery.of(context).size.width*0.12,
//   //       ),
//   //       Column(children: [
//   //         Padding(
//   //           padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
//   //           child: Text(
//   //             profileModel.name,
//   //             style: TextStyle(
//   //                 fontFamily: 'Readex Pro',
//   //                 fontSize: 14,
//   //                 fontWeight: FontWeight.bold,
//   //                 color: Colors.white),
//   //           ),
//   //         ),
//   //         Padding(
//   //           padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//   //           child: Text(
//   //             profileModel.email,
//   //             style: TextStyle(
//   //                 fontFamily: 'Readex Pro',
//   //                 fontSize: 14,
//   //                 fontWeight: FontWeight.normal,
//   //                 color: Colors.white),
//   //           ),
//   //         ),
//   //       ]),
//   //     ],
//   //   ),
//   ),
// );

/*
* Row(
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
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
                    child: Container(
                      width: 53,
                      height: 53,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height:  MediaQuery.of(context).size.width*0.5,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:Image.network(
                            profileModel.profilePicture ??
                             'assets/images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
                              fit: BoxFit.fill,
                                      ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.start, // Center vertically
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        profileModel.name,
                        style:
                        const TextStyle(fontSize: 14, color: kThirdTextColor),
                      ),
                      Text(
                        profileModel.email,
                        style: const TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 14,
                          color: kThirdTextColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                // GestureDetector(
                //   child: Icon(color: Colors.white, Icons.logout),
                //   onTap: () {
                //     AwesomeDialog(
                //       context: context,
                //       dialogType: DialogType.warning,
                //       animType: AnimType.rightSlide,
                //       //title: 'Error',
                //       title: 'Are you sure you want to Logout?',
                //       titleTextStyle:
                //           TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                //       btnOkOnPress: () {
                //         Navigator.pop(context);
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => LoginScreen(),
                //             ));
                //       },
                //       btnCancelOnPress: () {
                //         //Navigator.pop(context);
                //       },
                //     ).show();
                //   },
                // ),
              ],
            )
* */

//child: Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: kprimaryColor,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(2),
//                         child: Container(
//                           width: 50,
//                           height: 50,
//                           clipBehavior: Clip.antiAlias,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                           ),
//                           child: Image.network(
//                             profileModel.profilePicture ??
//                                 'assets/images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
