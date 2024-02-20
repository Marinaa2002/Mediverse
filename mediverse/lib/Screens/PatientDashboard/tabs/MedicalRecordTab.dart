import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Screens/PatientDashboard/MedicalRecord/DrNotesScreen.dart';
import 'package:mediverse/Screens/PatientDashboard/MedicalRecord/LabResultsScreen.dart';
import 'package:mediverse/Screens/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen.dart';
import 'package:mediverse/Screens/PatientDashboard/Widgets/MedicalInfoRow.dart';

class MedicalRecordsTab extends StatelessWidget {
  const MedicalRecordsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => MedicalPrescriptionsScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(185, 37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      backgroundColor: kprimaryColor,
                      textStyle: Themes.bodyXLarge.copyWith(
                        color: backgroundColor,
                      ),
                      elevation: 3,
                    ),
                    child: const Text('Prescriptions'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => LabResultsScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(185, 37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      backgroundColor: kprimaryColor,
                      textStyle: Themes.bodyXLarge.copyWith(
                        color: backgroundColor,
                      ),
                      elevation: 3,
                    ),
                    child: const Text('Lab Results'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
            child: ElevatedButton(
              onPressed: () {
                print('Button pressed ...');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => DrNotesScreen()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(185, 37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                backgroundColor: kprimaryColor,
                textStyle: Themes.bodyXLarge.copyWith(
                  color: backgroundColor,
                ),
                elevation: 3,
              ),
              child: const Text('Dr. Notes'),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Divider(
              thickness: 2,
              color: Color.fromARGB(255, 224, 227, 231),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Container(
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                color: kSecondryBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: kSecondaryTextColor,
                    offset: Offset(0, 5),
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: kprimaryColor,
                ),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MedicalInfoRow(text: 'Height :', value: '180 cm'),
                      MedicalInfoRow(text: 'Weight :', value: '70 kg'),
                      MedicalInfoRow(text: 'Blood Type :', value: 'B+'),
                      MedicalInfoRow(text: 'Blood Pressure :', value: '120/90'),
                      MedicalInfoRow(text: 'Blood Glucose Level :', value: '80 mg/dL'),
                      MedicalInfoRow(text: 'Cholesterol levels :', value: '200 mg/dL'),
                      MedicalInfoRow(text: 'Allergies :', value: 'Penicillin - Asprin - anesthics'),
                      MedicalInfoRow(text: 'Heart rate :', value: '80 bpm'),
                      MedicalInfoRow(text: 'Respiratory Rate:', value: '80 bpm'),
                      MedicalInfoRow(text: 'Temperature :', value: '37 C'),
                      MedicalInfoRow(text: 'Surgical History :', value: '-'),
                    ],
                  ),
                  ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
            child: GestureDetector(
              onTap: () {
              },
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
                    Text('Edit',
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