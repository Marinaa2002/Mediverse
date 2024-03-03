import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';

import '../../../../../../Core/Errors/Failure.dart';
import 'labResult_repo.dart';

class LabResultRepoImpl extends LabResultsRepo{
  CollectionReference messages =
  FirebaseFirestore.instance.collection('labs');

  @override
  sendLabs({required String now_date, required String imageUrl}) {
    try {
      messages.add({
        'createdAt': DateTime.now(),
        'pictureDate': now_date,
        'imageUrl' : imageUrl,
      });
    } on Exception catch (e) {

    }
  }

  @override
  Future<Either<Failure , List<LabResultModel>>> getLabs({required QuerySnapshot event}) async{
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