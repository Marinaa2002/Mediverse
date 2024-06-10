import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/InfoRow.dart';

class ViewHistory extends StatelessWidget {
  final String patientName;
  final String age;
  final String email;
  final String profilePicture;
  final List<Map<String, String>> medicalHistory;

  const ViewHistory({
    super.key,
    required this.patientName,
    required this.age,
    required this.email,
    required this.profilePicture,
    required this.medicalHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Medical History',
             style: Themes.headlineMedium.copyWith(
             color: backgroundColor,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            profilePicture,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(14, 20, 8, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              patientName,
                              textAlign: TextAlign.start,
                              style: Themes.bodyMed.copyWith(fontSize: 22),
                            ),
                            Text(
                              'Age: $age',
                              textAlign: TextAlign.start,
                              style: Themes.bodyMed.copyWith(fontSize: 18),
                            ),
                            Text(
                              email,
                              textAlign: TextAlign.start,
                              style: Themes.bodyMed.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                  child: Text(
                    'Medical History:',
                    style: Themes.bodyMedium.copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ),
              medicalHistory.isNotEmpty
                  ? SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: medicalHistory.map((json) {
                    return InfoRow(
                      height: json['Height'] ?? '',
                      weight: json['Weight'] ?? '',
                      bloodType: json['Blood Type'] ?? '',
                      bloodPressure: json['Blood Pressure'] ?? '',
                      bloodGlucoseLevel: json['Blood Glucose Level'] ?? '',
                      cholesterolLevels: json['Cholesterol Levels'] ?? '',
                      allergies: json['Allergies'] ?? '',
                      heartRate: json['Heart Rate'] ?? '',
                      respiratoryRate: json['Respiratory Rate'] ?? '',
                      temperature: json['Temperature'] ?? '',
                      surgicalHistory: json['Surgical History'] ?? '',
                    );
                  }).toList(),
                ),
              )
                  : Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.25,),
                    Center(
                      child: Text(
                        "No data entered yet",
                        style: Themes.bodyLarge.copyWith(fontSize: 24,fontWeight:FontWeight.w600,color: Colors.grey),
                      ),
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
