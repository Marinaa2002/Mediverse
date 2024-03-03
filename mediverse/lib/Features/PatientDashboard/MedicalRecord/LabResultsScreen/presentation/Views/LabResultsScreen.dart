import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultDateWidget.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultErrorWidget.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultLoadingIndicator.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultsPictureWidget.dart';
import '../Manager/lab_result_cubit/lab_result_cubit.dart';
import 'Widgets/LabResultButtonWidget.dart';

class LabResultsScreen extends StatelessWidget {
  LabResultsScreen({super.key});
  
  bool isLoading = false;

  List<LabResultModel> labModelList = [];
  final now_date = DateFormat('d - M - yyyy ').format(DateTime.now());

  // CollectionReference messages = FirebaseFirestore.instance.collection('labs');
  ScrollController _scrollController = ScrollController();

  static String id = 'LabResult';

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
          'Lab Results',
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
      body: BlocBuilder<LabResultCubit, LabResultState>(
        builder: (context, state) {
          if (state is LabResultSuccess) {
            labModelList = state.labModelList;
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
                        itemCount: labModelList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              LabResultDateWidget(
                                  labModelDate: labModelList[index]),
                              LabResultsPictureWidget(
                                  labModelPicture: labModelList[index],
                                  index: index,
                                  labModelList: labModelList),
                            ],
                          );
                        }),
                  ),
                  LabResultButtonWidget(scrollController: _scrollController),
                ],
              ),
            );
          } else if (state is LabResultFailure) {
            return LabResultErrorWidget(errMessage: state.errMessage);
          } else {
            return LabResultLoadingIndicatorWidget();
          }
        },
      ),
    );
  }
}
