import '../../../Constants/constant.dart';
import 'MedicalInfoRow.dart';
import 'package:flutter/material.dart';

import 'MedicalRowInfoData.dart';

class CustomMedicalRecordInfoData extends StatelessWidget {
  final String height;
  final String weight;
  final String bloodType;
  final String bloodPressure;
  final String bloodGlucoseLevel;
  final String cholesterolLevels;
  final String allergies;
  final String heartRate;
  final String respiratoryRate;
  final String temperature;
  final String surgicalHistory;

  const CustomMedicalRecordInfoData({
    Key? key,
    required this.height,
    required this.weight,
    required this.bloodType,
    required this.bloodPressure,
    required this.bloodGlucoseLevel,
    required this.cholesterolLevels,
    required this.allergies,
    required this.heartRate,
    required this.respiratoryRate,
    required this.temperature,
    required this.surgicalHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: Container(
          width: size.width * 0.92,
          height: size.height * 0.55,
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
           // shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  MedicalInfoRowData(text: 'Height :', value: height),
                  MedicalInfoRowData(text: 'Weight :', value: weight),
                  MedicalInfoRowData(text: 'Blood Type :', value: bloodType),
                  MedicalInfoRowData(
                    text: 'Blood Pressure :',
                    value: bloodPressure,
                  ),
                  MedicalInfoRowData(
                    text: 'Blood Glucose Level :',
                    value: bloodGlucoseLevel,
                  ),
                  MedicalInfoRowData(
                    text: 'Cholesterol levels :',
                    value: cholesterolLevels,
                  ),
                  MedicalInfoRowData(text: 'Allergies :', value: allergies),
                  MedicalInfoRowData(text: 'Heart rate :', value: heartRate),
                  MedicalInfoRowData(
                    text: 'Respiratory Rate:',
                    value: respiratoryRate,
                  ),
                  MedicalInfoRowData(
                    text: 'Temperature :',
                    value: temperature,
                  ),
                  MedicalInfoRowData(
                    text: 'Surgical History :',
                    value: surgicalHistory,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}