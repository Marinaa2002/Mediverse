import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/labResult_repo.dart';


part 'lab_result_state.dart';

class LabResultCubit extends Cubit<LabResultState> {
  LabResultCubit(this.labResultsRepo ) : super(LabResultInitial());

  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  final LabResultsRepo labResultsRepo;
  var messages = FirebaseFirestore.instance;
  //FirebaseFirestore.instance.collection('labs');


  void sendLabModel({required String now_date, required String imageUrl}) {
    emit(LabResultLoading());
    try {
      labResultsRepo.sendLabs(now_date: now_date, imageUrl: imageUrl);
    } on Exception catch (e) {
      emit(LabResultFailure('Something went wrong, Try again'));
    }
  }

  void getLabModels() async{
    emit(LabResultLoading());
    await messages.collection('info_Patients/$currentUser/lab Results').orderBy('createdAt', descending: true).snapshots().listen((event) async {
      var result = await labResultsRepo.getLabs(event: event);
      result.fold((left) =>
          emit(LabResultFailure(left.errMsg)),
              (right) =>
                  emit(LabResultSuccess(labModelList: right))
      );
    });
  }

}