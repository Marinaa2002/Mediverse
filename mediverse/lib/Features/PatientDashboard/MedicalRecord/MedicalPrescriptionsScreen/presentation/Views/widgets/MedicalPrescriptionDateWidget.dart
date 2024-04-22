import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/data/models/medical_prescription_model.dart';

class MedicalPrescriptionDateWidget extends StatelessWidget {
  MedicalPrescriptionDateWidget(
      {super.key, required this.medicalPrescriptionModelDate});
  MedicalPrescriptionModel medicalPrescriptionModelDate;

  @override
  Widget build(BuildContext context) {
    // Convert Timestamp to DateTime object
    DateTime dateTime = medicalPrescriptionModelDate.createdAt.toDate();

// Format DateTime object as a date string
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
        child: Text(formattedDate, style: Themes.DateText),
      ),
    );
  }
}
