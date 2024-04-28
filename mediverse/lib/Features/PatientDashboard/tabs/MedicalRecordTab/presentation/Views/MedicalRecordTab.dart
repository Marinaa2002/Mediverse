import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalRecordEditScreen/presentation/Views/MedicalRecordEditScreen.dart';
import '../../../../../../Constants/Themes.dart';
import '../../../../MedicalRecord/DrNotesScreen/presentation/Views/DrNotesScreen.dart';
import '../../../../MedicalRecord/LabResultsScreen/presentation/Views/LabResultsScreen.dart';
import '../../../../MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/MedicalPrescriptionsScreen.dart';
import '../../../../MedicalRecord/MedicalRecordEditScreen/data/models/MRmodel.dart';
import '../../../../Widgets/CustomButtonMedicalRecord.dart';
import '../../../../Widgets/CustomEditConfirm.dart';
import '../../../../Widgets/CustomMedicalInfoRowData.dart';

class MedicalRecordsTab extends StatelessWidget {
  const MedicalRecordsTab({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('info_Patients')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (!snapshot.hasData || snapshot.data!.data() == null) {
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(100, 300, 100, 300),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicalRecordEditScreen(),
                  ),
                );
              },
              child: CustomEditConfirm(text: 'Edit'),
            ),
          );
        }
        try {
          final data = snapshot.data!.data() as Map<String, dynamic>;
          List<MRmodel> medicalRecords = List<MRmodel>.from(data['Medical Records'].map((record) => MRmodel.fromJson(record)));
          final record = medicalRecords[medicalRecords.length-1];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonMedicalRecord(
                      text: 'Prescriptions',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => MedicalPrescriptionsScreen()));
                      },
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    CustomButtonMedicalRecord(
                      text: 'Lab Results',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => LabResultsScreen()));
                      },
                    ),
                  ],
                ),
              ),
              CustomButtonMedicalRecord(
                text: 'Dr. Notes',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => DrNotesScreen()));
                },
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Divider(
                  thickness: 2,
                  color: Color.fromARGB(255, 224, 227, 231),
                ),
              ),
              CustomMedicalRecordInfoData(
                height: record.height.isNotEmpty ? record.height : "",
                weight: record.weight.isNotEmpty ? record.weight : "",
                bloodType: record.bloodType.isNotEmpty ? record.bloodType : "",
                bloodPressure: record.bloodPressure.isNotEmpty ? record.bloodPressure : "",
                bloodGlucoseLevel: record.bloodGlucoseLevel.isNotEmpty ? record.bloodGlucoseLevel : "",
                cholesterolLevels: record.cholesterolLevels.isNotEmpty ? record.cholesterolLevels : "",
                allergies: record.allergies.isNotEmpty ? record.allergies : "",
                heartRate: record.heartRate.isNotEmpty ? record.heartRate : "",
                respiratoryRate: record.respiratoryRate.isNotEmpty ? record.respiratoryRate : "",
                temperature: record.temperature.isNotEmpty ? record.temperature : "",
                surgicalHistory: record.surgicalHistory.isNotEmpty ? record.surgicalHistory : "",
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicalRecordEditScreen(),
                      ),
                    );
                  },
                  child: CustomEditConfirm(text: 'Edit'),
                ),
              ),
            ],
          );
        } catch (e) {
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(100, 300, 100, 300),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicalRecordEditScreen(),
                  ),
                );
              },
              child: CustomEditConfirm(text: 'Edit'),
            ),
          );
        }
        return
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child:
            Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtonMedicalRecord(
                        text: 'Prescriptions',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => MedicalPrescriptionsScreen()));
                        },
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      CustomButtonMedicalRecord(
                        text: 'Lab Results',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => LabResultsScreen()));
                        },
                      ),
                    ],
                  ),
                ),
                CustomButtonMedicalRecord(
                  text: 'Dr. Notes',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => DrNotesScreen()));
                  },
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Divider(
                    thickness: 2,
                    color: Color.fromARGB(255, 224, 227, 231),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.25,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        'Enter your Medical Records',
                        style: Themes.title
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => MedicalRecordEditScreen(),
                          ),
                        );
                      },
                      child: CustomEditConfirm(text: 'Click Here'),
                    ),
                  ],)
              ],
            ),

          );
      },
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalRecordEditScreen/presentation/Views/MedicalRecordEditScreen.dart';
// import '../../../../../../Constants/Themes.dart';
// import '../../../../MedicalRecord/DrNotesScreen/presentation/Views/DrNotesScreen.dart';
// import '../../../../MedicalRecord/LabResultsScreen/presentation/Views/LabResultsScreen.dart';
// import '../../../../MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/MedicalPrescriptionsScreen.dart';
// import '../../../../MedicalRecord/MedicalRecordEditScreen/data/models/MRmodel.dart';
// import '../../../../Widgets/CustomButtonMedicalRecord.dart';
// import '../../../../Widgets/CustomEditConfirm.dart';
// import '../../../../Widgets/CustomMedicalInfoRowData.dart';
// import '../Manager/retr_data_cubit.dart';
// import '../Manager/retr_data_state.dart';
//
// class MedicalRecordsTab extends StatelessWidget {
//   const MedicalRecordsTab({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<RetrDataCubit, RetrDataState>(
//       listener: (context, state) {
//
//       },
//       builder: (context, state) {
//         if (state is RetrDataLoading) {
//           return CircularProgressIndicator();
//         } else if (state is RetrDataSuccess) {
//           final medicalRecords = state.medicalRecords;
//           return _buildContent(context, medicalRecords);
//         } else if (state is RetrDataFailure) {
//           return _buildFailure(context, state.errMsg);
//         } else {
//           // Handle initial state
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
//
//   Widget _buildContent(BuildContext context, List<MRmodel> medicalRecords) {
//     if (medicalRecords.isEmpty) {
//       return _buildEmptyContent(context);
//     } else {
//       final record = medicalRecords[medicalRecords.length-1];
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomButtonMedicalRecord(
//                   text: 'Prescriptions',
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (ctx) => MedicalPrescriptionsScreen()));
//                   },
//                 ),
//                 SizedBox(width: MediaQuery.of(context).size.width * 0.02),
//                 CustomButtonMedicalRecord(
//                   text: 'Lab Results',
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (ctx) => LabResultsScreen()));
//                   },
//                 ),
//               ],
//             ),
//           ),
//           CustomButtonMedicalRecord(
//             text: 'Dr. Notes',
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (ctx) => DrNotesScreen()));
//             },
//           ),
//           const Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//             child: Divider(
//               thickness: 2,
//               color: Color.fromARGB(255, 224, 227, 231),
//             ),
//           ),
//           CustomMedicalRecordInfoData(
//             height: record.height.isNotEmpty ? record.height : "",
//             weight: record.weight.isNotEmpty ? record.weight : "",
//             bloodType: record.bloodType.isNotEmpty ? record.bloodType : "",
//             bloodPressure: record.bloodPressure.isNotEmpty ? record.bloodPressure : "",
//             bloodGlucoseLevel: record.bloodGlucoseLevel.isNotEmpty ? record.bloodGlucoseLevel : "",
//             cholesterolLevels: record.cholesterolLevels.isNotEmpty ? record.cholesterolLevels : "",
//             allergies: record.allergies.isNotEmpty ? record.allergies : "",
//             heartRate: record.heartRate.isNotEmpty ? record.heartRate : "",
//             respiratoryRate: record.respiratoryRate.isNotEmpty ? record.respiratoryRate : "",
//             temperature: record.temperature.isNotEmpty ? record.temperature : "",
//             surgicalHistory: record.surgicalHistory.isNotEmpty ? record.surgicalHistory : "",
//           ),
//
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MedicalRecordEditScreen(),
//                   ),
//                 );
//               },
//               child: CustomEditConfirm(text: 'Edit'),
//             ),
//           ),
//         ],
//       );
//     }
//   }
//
//   Widget _buildEmptyContent(BuildContext context) {
//     return Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(100, 300, 100, 300),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Enter your Medical Records',
//             style: Themes.title,
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(context,
//                 MaterialPageRoute(
//                   builder: (context) => MedicalRecordEditScreen(),
//                 ),
//               );
//             },
//             child: CustomEditConfirm(text: 'Click Here'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFailure(BuildContext context, String errMsg) {
//     return Center(
//       child: Text(errMsg),
//     );
//   }
// }