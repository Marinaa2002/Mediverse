import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/constant.dart';

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
      body: BlocBuilder<MedicalPrescriptionCubit, MedicalPrescriptionState>(
        builder: (context, state) {
          if (state is MedicalPrescriptionSuccess) {
            medicalModelList = state.medicalModelList;
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
                        itemCount: medicalModelList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              MedicalPrescriptionDateWidget(
                                  medicalPrescriptionModelDate: medicalModelList[index]),
                              MedicalPrescriptionPictureWidget(
                                  medicalPrescriptionPicture: medicalModelList[index],
                                  index: index,
                                  medicalPrescriptionModelList: medicalModelList),
                            ],
                          );
                        }),
                  ),
                  MedicalPrescriptionButtonWidget(scrollController: _scrollController),
                ],
              ),
            );
          } else if (state is MedicalPrescriptionFailure) {
            return MedicalPrescriptionErrorWidget(errMessage: state.errMessage);
          } else {
            return MedicalPrescriptionLoadingIndicatorWidget();
          }
        },
      ),
    );
  }
}
