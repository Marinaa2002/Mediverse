import '../../../Constants/constant.dart';
import 'MedicalInfoRow.dart';
import 'package:flutter/material.dart';

class CustomMedicalRecordInfo extends StatelessWidget {
  const CustomMedicalRecordInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: Container(
          width: size.width*0.92,
          height: size.height*0.9,
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
                  MedicalInfoRow(
                      text: 'Blood Glucose Level :', value: '80 mg/dL'),
                  MedicalInfoRow(
                      text: 'Cholesterol levels :', value: '200 mg/dL'),
                  MedicalInfoRow(
                      text: 'Allergies :',
                      value: 'Penicillin - Asprin - anesthics'),
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
    );
  }
}
