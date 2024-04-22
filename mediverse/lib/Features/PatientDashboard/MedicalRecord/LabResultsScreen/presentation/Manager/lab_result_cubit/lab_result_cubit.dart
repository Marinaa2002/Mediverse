import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/labResult_repo.dart';

part 'lab_result_state.dart';

class LabResultCubit extends Cubit<LabResultState> {
  LabResultCubit(
    this.labResultsRepo,
  ) : super(LabResultInitial());
  String _patiendId = '';
  String _lab_id = '';
  final LabResultsRepo labResultsRepo;
  // Setters for patientId and labId
  void setIds(String patientId, String lab_Id) {
    _patiendId = patientId;
    _lab_id = lab_Id;
  }

  CollectionReference labResults =
      FirebaseFirestore.instance.collection('Lab_Results');

  void sendLabModel({
    required String id,
    required String lab_id,
    required String now_date,
    required String imageUrl,
  }) {
    emit(LabResultLoading());
    try {
      labResultsRepo.sendLabs(
        id: id,
        lab_id: lab_id,
        now_date: now_date,
        imageUrl: imageUrl,
      );
    } on Exception catch (e) {
      emit(LabResultFailure('Something went wrong, Try again'));
    }
  }

  void getLabModels() async {
    emit(LabResultLoading());

    // Check if the collection exists
    final collectionSnapshot = await labResults.get();
    if (collectionSnapshot.docs.isEmpty) {
      // Handle case where the collection doesn't exist
      emit(LabResultEmpty());
      return;
    }
    await labResults
        .orderBy('createdAt', descending: true)
        .where(
          'Lab_id',
          isEqualTo: _lab_id,
        )
        .where(
          'id',
          isEqualTo: _patiendId,
        )
        .snapshots()
        .listen((event) async {
      if (event.docs.isEmpty) {
        // Handle empty snapshot here
        emit(LabResultEmpty());
        return;
        // You can emit a specific state indicating empty results if needed
      } else {
        var result = await labResultsRepo.getLabs(event: event);
        result.fold((left) => emit(LabResultFailure(left.errMsg)),
            (right) => emit(LabResultSuccess(labModelList: right)));
      }
    });
  }
}
