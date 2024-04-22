import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/PatientDashboard/tabs/MedicalRecordTab/presentation/Manager/retr_data_state.dart';

import '../../../../MedicalRecord/MedicalRecordEditScreen/data/models/MRmodel.dart';

class RetrDataCubit extends Cubit<RetrDataState> {
  RetrDataCubit() : super(RetrDataInitial());

  Future<void> RetrDataMedicalRec() async {
    try {
      emit(RetrDataLoading());

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('info_Patients')
            .doc(currentUser.uid)
            .get();

        if (snapshot.exists) {
          final data = snapshot.data() as Map<String, dynamic>;
          final List<dynamic> medicalRecordsData = data['Medical Records'] ?? [];
          final List<MRmodel> medicalRecords = medicalRecordsData.map((record) => MRmodel.fromJson(record)).toList();

          emit(RetrDataSuccess(medicalRecords: medicalRecords));
        } else {
          emit(RetrDataFailure(errMsg: 'Document does not exist'));
        }
      } else {
        emit(RetrDataFailure(errMsg: 'Current user is null'));
      }
    } catch (e) {
      emit(RetrDataFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}

