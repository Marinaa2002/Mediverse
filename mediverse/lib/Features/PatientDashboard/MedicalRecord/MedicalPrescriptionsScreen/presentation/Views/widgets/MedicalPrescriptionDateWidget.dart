import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/data/models/medical_prescription_model.dart';

class MedicalPrescriptionDateWidget extends StatelessWidget {
  MedicalPrescriptionDateWidget({super.key,required this.medicalPrescriptionModelDate});
  MedicalPrescriptionModel medicalPrescriptionModelDate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
        child: Text(
            medicalPrescriptionModelDate.pictureDate,
            style: Themes.DateText
        ),
      ),
    );
  }
}
