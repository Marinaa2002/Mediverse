import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomEditConfirmButton.dart';

import '../MedicalRecord/DrNotesScreen/presentation/Views/DrNotesScreen.dart';
import '../MedicalRecord/LabResultsScreen/presentation/Views/LabResultsScreen.dart';
import '../MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/MedicalPrescriptionsScreen.dart';
import '../Widgets/CustomButtonMedicalRecord.dart';
import '../Widgets/CustomMedicalRecordInfo.dart';

class MedicalRecordsTab extends StatelessWidget {
  const MedicalRecordsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
                    }),
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                CustomButtonMedicalRecord(
                    text: 'Lab Results',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => LabResultsScreen()));
                    }),
              ],
            ),
          ),
          CustomButtonMedicalRecord(
              text: 'Dr. Notes',
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => DrNotesScreen()));
              }),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Divider(
              thickness: 2,
              color: Color.fromARGB(255, 224, 227, 231),
            ),
          ),
          CustomMedicalRecordInfo(),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
            child: CustomEditConfirm(text: 'Edit',)
          ),
        ],
      ),
    );
  }
}
