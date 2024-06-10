import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/PatientDashboard/MainScreen.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalRecordEditScreen/presentation/Manager/save_data_cubit.dart';
import '../../../../../../Constants/constant.dart';
import '../../../../Widgets/CustomEditConfirm.dart';
import '../../../../Widgets/MedicalInfoRow.dart';
import '../../data/models/MRmodel.dart';

class MedicalRecordEditScreen extends StatelessWidget {
  MedicalRecordEditScreen({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController bloodTypeController = TextEditingController();
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController bloodGlucoseLevelController = TextEditingController();
  final TextEditingController cholesterolLevelsController = TextEditingController();
  final TextEditingController allergiesController = TextEditingController();
  final TextEditingController heartRateController = TextEditingController();
  final TextEditingController respiratoryRateController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController surgicalHistoryController = TextEditingController();
  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('info_Patients')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("Token::${FirebaseAuth.instance.currentUser!.uid}");
          return Loading();
        }

        if (snapshot.hasData && snapshot.data!.exists) {
          final data = snapshot.data!.data() as Map<String, dynamic>?;

          if (data != null && data.containsKey('Medical Records')) {
            List<MRmodel> medicalRecords = [];
            try {
              List<dynamic> records = data['Medical Records'];
              medicalRecords = records.map((record) {
                try {
                  return MRmodel.fromJson(Map<String, dynamic>.from(record));
                } catch (e) {
                  print('Error parsing record: $e');
                  return MRmodel(
                    height: '',
                    weight: '',
                    bloodType: '',
                    bloodPressure: '',
                    bloodGlucoseLevel: '',
                    cholesterolLevels: '',
                    allergies: '',
                    heartRate: '',
                    respiratoryRate: '',
                    temperature: '',
                    surgicalHistory: '',
                  );
                }
              }).toList();
            } catch (e) {
              print('Error parsing medical records: $e');
            }

            if (medicalRecords.isNotEmpty) {
              final record = medicalRecords[medicalRecords.length-1];
              return BlocConsumer<SaveDataCubit, SaveDataState>(
                listener: (context, state) {
                  if (state is SaveDataLoading) {
                    isLoading = true;
                  } else if (state is SaveDataSuccess) {
                    isLoading = false;
                  } else if (state is SaveDataFailure) {
                    showSnackbar(context, state.errMsg);
                    isLoading = false;
                  }
                },
                builder: (context, state) {
                  return Scaffold(
                    key: scaffoldKey,
                    backgroundColor: backgroundColor,
                    appBar: AppBar(
                      backgroundColor: kprimaryColor,
                      automaticallyImplyLeading: false,
                      leading: IconButton(
                        icon: const Icon(
                          Icons.chevron_left,
                          color: kSecondryBackgroundColor,
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      title: Text(
                        'Medical Records',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      actions: [],
                      centerTitle: true,
                      elevation: 2,
                    ),
                    body: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                MedicalInfoRow(text: 'Height :', controller: heightController,hint:record.height ,),
                                MedicalInfoRow(text: 'Weight :', controller: weightController,hint:record.weight ,),
                                MedicalInfoRow(text: 'Blood Type :', controller: bloodTypeController,hint:record.bloodType ,),
                                MedicalInfoRow(text: 'Blood Pressure :', controller: bloodPressureController,hint:record.bloodPressure ,),
                                MedicalInfoRow(text: 'Blood Glucose Level :', controller: bloodGlucoseLevelController,hint:record.bloodGlucoseLevel ,),
                                MedicalInfoRow(text: 'Cholesterol levels :', controller: cholesterolLevelsController,hint:record.cholesterolLevels ,),
                                MedicalInfoRow(text: 'Allergies :', controller: allergiesController,hint:record.allergies ,),
                                MedicalInfoRow(text: 'Heart rate :', controller: heartRateController,hint:record.heartRate ,),
                                MedicalInfoRow(text: 'Respiratory Rate:', controller: respiratoryRateController,hint:record.respiratoryRate ,),
                                MedicalInfoRow(text: 'Temperature :', controller: temperatureController,hint:record.temperature,),
                                MedicalInfoRow(text: 'Surgical History :', controller: surgicalHistoryController,hint:record.surgicalHistory ,),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                              child: GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<SaveDataCubit>(context).saveDataMedicalRec(
                                      height: heightController.text.trim().isEmpty ? record.height : heightController.text.trim(),
                                      weight: weightController.text.trim().isEmpty ? record.weight : weightController.text.trim(),
                                      bloodType: bloodTypeController.text.trim().isEmpty ? record.bloodType : bloodTypeController.text.trim(),
                                      bloodPressure: bloodPressureController.text.trim().isEmpty ? record.bloodPressure : bloodPressureController.text.trim(),
                                      bloodGlucoseLevel: bloodGlucoseLevelController.text.trim().isEmpty ? record.bloodGlucoseLevel : bloodGlucoseLevelController.text.trim(),
                                      cholesterolLevels: cholesterolLevelsController.text.trim().isEmpty ? record.cholesterolLevels : cholesterolLevelsController.text.trim(),
                                      allergies: allergiesController.text.trim().isEmpty ? record.allergies : allergiesController.text.trim(),
                                      heartRate: heartRateController.text.trim().isEmpty ? record.heartRate : heartRateController.text.trim(),
                                      respiratoryRate: respiratoryRateController.text.trim().isEmpty ? record.respiratoryRate : respiratoryRateController.text.trim(),
                                      temperature: temperatureController.text.trim().isEmpty ? record.temperature : temperatureController.text.trim(),
                                      surgicalHistory: surgicalHistoryController.text.trim().isEmpty ? record.surgicalHistory : surgicalHistoryController.text.trim(),

                                    );
                                  }

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreenWidget(),));
                                },
                                child: CustomEditConfirm(text: 'Save'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return BlocConsumer<SaveDataCubit, SaveDataState>(
                listener: (context, state) {
                  if (state is SaveDataLoading) {
                    isLoading = true;
                  } else if (state is SaveDataSuccess) {
                    isLoading = false;
                  } else if (state is SaveDataFailure) {
                    showSnackbar(context, state.errMsg);
                    isLoading = false;
                  }
                },
                builder: (context, state) {
                  return Scaffold(
                    key: scaffoldKey,
                    backgroundColor: backgroundColor,
                    appBar: AppBar(
                      backgroundColor: kprimaryColor,
                      automaticallyImplyLeading: false,
                      leading: IconButton(
                        icon: const Icon(
                          Icons.chevron_left,
                          color: kSecondryBackgroundColor,
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      title: Text(
                        'Medical Records',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      actions: [],
                      centerTitle: true,
                      elevation: 2,
                    ),
                    body: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                MedicalInfoRow(text: 'Height :', controller: heightController),
                                MedicalInfoRow(text: 'Weight :', controller: weightController),
                                MedicalInfoRow(text: 'Blood Type :', controller: bloodTypeController),
                                MedicalInfoRow(text: 'Blood Pressure :', controller: bloodPressureController),
                                MedicalInfoRow(text: 'Blood Glucose Level :', controller: bloodGlucoseLevelController),
                                MedicalInfoRow(text: 'Cholesterol levels :', controller: cholesterolLevelsController),
                                MedicalInfoRow(text: 'Allergies :', controller: allergiesController),
                                MedicalInfoRow(text: 'Heart rate :', controller: heartRateController),
                                MedicalInfoRow(text: 'Respiratory Rate:', controller: respiratoryRateController),
                                MedicalInfoRow(text: 'Temperature :', controller: temperatureController),
                                MedicalInfoRow(text: 'Surgical History :', controller: surgicalHistoryController),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                              child: GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<SaveDataCubit>(context).saveDataMedicalRec(
                                      height: heightController.text.trim(),
                                      weight: weightController.text.trim(),
                                      bloodType: bloodTypeController.text.trim(),
                                      bloodPressure: bloodPressureController.text.trim(),
                                      bloodGlucoseLevel: bloodGlucoseLevelController.text.trim(),
                                      cholesterolLevels: cholesterolLevelsController.text.trim(),
                                      allergies: allergiesController.text.trim(),
                                      heartRate: heartRateController.text.trim(),
                                      respiratoryRate: respiratoryRateController.text.trim(),
                                      temperature: temperatureController.text.trim(),
                                      surgicalHistory: surgicalHistoryController.text.trim(),

                                    );
                                  }

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreenWidget(),));
                                },
                                child: CustomEditConfirm(text: 'Save'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        }

        return Text('Error: No data available');
      },
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

