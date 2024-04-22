import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
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
              children: [
                CustomButtonMedicalRecord(
                    text: 'Prescriptions',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => MedicalPrescriptionsScreen()));
                    }),
                CustomButtonMedicalRecord(
                    text: 'Lab Results',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/LabResultsScreen', arguments: {
                        'labresult_id': 'A',
                      });
                    }),
              ],
            ),
          ),
          CustomButtonMedicalRecord(
              text: 'Dr. Notes',
              onPressed: () {
                Navigator.of(context).pushNamed('/DrNotes');
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
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 100,
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kprimaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit',
                      style: Themes.titleLarge.copyWith(
                        color: Colors.white,
                        fontFamily: 'Readex Pro',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
