import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';

import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultButtonWidget.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultDateWidget.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultErrorWidget.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultLoadingIndicator.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultsPictureWidget.dart';
import 'package:mediverse/Features/StaffDashboard/LabStaffMainScreen/presentation/LabResultButtonWidgetStaff.dart';

class LabResultPatientStaffPortal extends StatelessWidget {
  LabResultPatientStaffPortal({
    super.key,
  });

  bool isLoading = false;
  String id = '';

  final now_date = DateFormat('d - M - yyyy ').format(DateTime.now());

  ScrollController _scrollController = ScrollController();

  CollectionReference labResults =
      FirebaseFirestore.instance.collection('Lab_Results');
  @override
  Widget build(BuildContext context) {
    // Retrieve named arguments from the route settings
    Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      id = args['id'];
    }
    // BlocProvider.of<LabResultCubit>(context)
    // .setIds(currentUserId, labresult_id);
    // BlocProvider.of<LabResultCubit>(context).getLabModels();
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
          'Lab Results',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [],
        elevation: 2,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: labResults
            .orderBy('createdAt', descending: true)
            .where(
              'Lab_id',
              isEqualTo: globalcurrentUserId,
            )
            .where(
              'id',
              isEqualTo: id,
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
            List<LabResultModel> labResultsList = [];
            if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                      child: LabResultErrorWidget(
                          errMessage: 'No lab results available')),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: LabResultButtonWidgetStaff(
                      scrollController: _scrollController,
                      patientId: id,
                    ),
                  ),
                ],
              );
            }

            for (var doc in snapshot.data!.docs) {
              labResultsList.add(LabResultModel.fromJson(doc));
            }
            if (!labResultsList.isEmpty) {
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
                          itemCount: labResultsList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                LabResultDateWidget(
                                    labModelDate: labResultsList[index]),
                                LabResultsPictureWidget(
                                    labModelPicture: labResultsList[index],
                                    index: index,
                                    labModelList: labResultsList),
                              ],
                            );
                          }),
                    ),
                    LabResultButtonWidgetStaff(
                      scrollController: _scrollController,
                      patientId: id,
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: LabResultButtonWidgetStaff(
                      scrollController: _scrollController,
                      patientId: id,
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
                  child: LabResultButtonWidgetStaff(
                    scrollController: _scrollController,
                    patientId: id,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
