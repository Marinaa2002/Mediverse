import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorProfile/presentation/Views/Widgets/DoctorProfileSettingsWidget.dart';

import 'Widgets/DoctorProfileLoadingIndicatorWidget.dart';

class DoctorProfile extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'My Profile',
            style: Themes.headlineMedium.copyWith(
              color: backgroundColor,
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2,
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("info_Doctors")
                .doc(currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userData = snapshot.data!.data() as Map<String, dynamic>;
                return Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 4),
                            child: Text(
                              'Dr.' + userData['Name'],
                              textAlign: TextAlign.center,
                              style: Themes.headlineSmall.copyWith(
                                fontFamily: 'Outfit',
                                color: kprimaryTextColor,
                              ),
                            ),
                          ),
                          Text(
                            userData['Email'],
                            style: Themes.titleSmall.copyWith(
                                fontFamily: 'Outfit',
                                color: kprimaryTextColor,
                                fontSize: 20),
                          ),
                          SizedBox(height: 50),
                          DoctorProfileSettingsWidget(userData: userData,),
                        ]));
              } else {
                return DoctorProfileLoadingIndicatorWidget();
              }
            }));
  }
}

//       Align(
//         alignment: const AlignmentDirectional(0, 0),
//         child: Padding(
//           padding:
//               const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
//           child: Material(
//             color: Colors.transparent,
//             elevation: 3,
//             shape: const CircleBorder(),
//             child: Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: backgroundColor,
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: kprimaryColor,
//                   width: 2,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(2),
//                 child: Hero(
//                   tag: 'profile',
//                   child: Container(
//                     width: 50,
//                     height: 50,
//                     clipBehavior: Clip.antiAlias,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                     ),
//                     child: Image.asset(
//                       'assets/images/Human.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       Align(
//         alignment: const AlignmentDirectional(1, 0),
//         child: Padding(
//           padding:
//               const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
//           child: ClipOval(
//             child: Container(
//               width: 43,
//               height: 43,
//               decoration: BoxDecoration(
//                 color: kSecondryBackgroundColor,
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: kprimaryColor,
//                   width: 2,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(7),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(0),
//                   child: Image.asset(
//                     'assets/images/draw.png',
//                     width: 30,
//                     height: 30,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
