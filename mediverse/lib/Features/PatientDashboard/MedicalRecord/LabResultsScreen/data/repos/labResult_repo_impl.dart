import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';

import '../../../../../../Core/Errors/Failure.dart';
import 'labResult_repo.dart';

class LabResultRepoImpl extends LabResultsRepo {
  CollectionReference labResult =
      FirebaseFirestore.instance.collection('Lab_Results');

  @override
  sendLabs(
      {required String id,
      required String lab_id,
      required String now_date,
      required String imageUrl}) {
    try {
      labResult.add({
        'id': id,
        'Lab_id': lab_id,
        'createdAt': DateTime.now(),
        'imageUrl': imageUrl,
      });
    } on Exception catch (e) {}
  }

  @override
  Future<Either<Failure, List<LabResultModel>>> getLabs(
      {required QuerySnapshot event}) async {
    try {
      List<LabResultModel> messageList = [];
      for (var doc in event.docs) {
        messageList.add(LabResultModel.fromJson(doc));
      }
      return right(messageList);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}
