import 'package:flutter/material.dart';

import '../../PatientDashboard/Widgets/MedicalRowInfoData.dart';

class InfoRow extends StatelessWidget {
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

  const InfoRow({
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MedicalInfoRowData(text: 'Height:', value: height),
          MedicalInfoRowData(text: 'Weight:', value: weight),
          MedicalInfoRowData(text: 'Blood Type:', value: bloodType),
          MedicalInfoRowData(text: 'Blood Pressure:', value: bloodPressure),
          MedicalInfoRowData(text: 'Blood Glucose Level:', value: bloodGlucoseLevel),
          MedicalInfoRowData(text: 'Cholesterol Levels:', value: cholesterolLevels),
          MedicalInfoRowData(text: 'Allergies:', value: allergies),
          MedicalInfoRowData(text: 'Heart Rate:', value: heartRate),
          MedicalInfoRowData(text: 'Respiratory Rate:', value: respiratoryRate),
          MedicalInfoRowData(text: 'Temperature:', value: temperature),
          MedicalInfoRowData(text: 'Surgical History:', value: surgicalHistory),
        ],
      ),
    );
  }
}
