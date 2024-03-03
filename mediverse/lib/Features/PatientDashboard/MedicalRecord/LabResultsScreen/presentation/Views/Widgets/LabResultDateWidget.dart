import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';

class LabResultDateWidget extends StatelessWidget {
  LabResultDateWidget({super.key,required this.labModelDate});
  LabResultModel labModelDate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
        child: Text(
            labModelDate.pictureDate,
            style: Themes.DateText
        ),
      ),
    );
  }
}
