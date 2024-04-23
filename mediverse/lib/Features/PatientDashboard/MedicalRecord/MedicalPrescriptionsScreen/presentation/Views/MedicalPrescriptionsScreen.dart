import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultErrorWidget.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultLoadingIndicator.dart';

import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/data/models/medical_prescription_model.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Manager/medical_prescription_cubit/medical_prescription_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/widgets/MedicalPrescriptionButtonWidget.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/widgets/MedicalPrescriptionDateWidget.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/widgets/MedicalPrescriptionErrorWidget.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/widgets/MedicalPrescriptionLoadingIndicator.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/widgets/MedicalPrescriptionPictureWidget.dart';

class MedicalPrescriptionsScreen extends StatelessWidget {
  MedicalPrescriptionsScreen({super.key});

  bool isLoading = false;

  List<MedicalPrescriptionModel> medicalModelList = [];
  final now_date = DateFormat('d - M - yyyy ').format(DateTime.now());
  CollectionReference medicalPrescription =
      FirebaseFirestore.instance.collection('medicalPrescriptions');

  ScrollController _scrollController = ScrollController();

  static String id = 'MedicalPrescription';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
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
          'Medical Prescriptions',
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
      body: StreamBuilder<QuerySnapshot>(
        stream: medicalPrescription
            .orderBy('createdAt', descending: true)
            .where(
              'id',
              isEqualTo: globalcurrentUserId,
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LabResultLoadingIndicatorWidget();
          }
          if (snapshot.hasError) {
            return LabResultErrorWidget(
              errMessage: 'Error: ${snapshot.error}',
            );
          }
          if (snapshot.hasData) {
            List<MedicalPrescriptionModel> medicalPrescriptions = [];
            if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                      child: LabResultErrorWidget(
                          errMessage: 'No Medical Prescription available')),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: MedicalPrescriptionButtonWidget(
                      scrollController: _scrollController,
                    ),
                  ),
                ],
              );
            }

            for (var doc in snapshot.data!.docs) {
              medicalPrescriptions.add(MedicalPrescriptionModel.fromJson(doc));
            }
            if (!medicalPrescriptions.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: medicalPrescriptions.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                MedicalPrescriptionDateWidget(
                                    medicalPrescriptionModelDate:
                                        medicalPrescriptions[index]),
                                MedicalPrescriptionPictureWidget(
                                    medicalPrescriptionPicture:
                                        medicalPrescriptions[index],
                                    index: index,
                                    medicalPrescriptionModelList:
                                        medicalPrescriptions),
                              ],
                            );
                          }),
                    ),
                    MedicalPrescriptionButtonWidget(
                      scrollController: _scrollController,
                    )
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: MedicalPrescriptionButtonWidget(
                      scrollController: _scrollController,
                    ),
                  ),
                ],
              );
            }
          } else {
            return Column(
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: MedicalPrescriptionButtonWidget(
                      scrollController: _scrollController,
                    )),
              ],
            );
          }
        },
      ),
    );
  }
}
