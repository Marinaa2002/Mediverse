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
                  MedicalInfoRow(text: 'Height :',),
                  MedicalInfoRow(text: 'Weight :',),
                  MedicalInfoRow(text: 'Blood Type :',),
                  MedicalInfoRow(text: 'Blood Pressure :', ),
                  MedicalInfoRow(
                    text: 'Blood Glucose Level :',),
                  MedicalInfoRow(
                      text: 'Cholesterol levels :'),
                  MedicalInfoRow(
                    text: 'Allergies :',
                  ),
                  MedicalInfoRow(text: 'Heart rate :'),
                  MedicalInfoRow(text: 'Respiratory Rate:',),
                  MedicalInfoRow(text: 'Temperature :', ),
                  MedicalInfoRow(text: 'Surgical History :',),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
