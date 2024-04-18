import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';

import '../../../../../../Core/Errors/Failure.dart';
import 'labResult_repo.dart';

class LabResultRepoImpl extends LabResultsRepo {
  // CollectionReference messages =
  // FirebaseFirestore.instance.collection('labs');
  var messages = FirebaseFirestore.instance;

  late DocumentSnapshot documentSnapshot;
  final currentUser = FirebaseAuth.instance.currentUser!.uid;

  @override
  sendLabs({required String now_date, required String imageUrl}) async{
    try {
      // Map<String, dynamic> info ={
      //   'createdAt': DateTime.now(),
      //     'pictureDate': now_date,
      //     'imageUrl' : imageUrl
      // };
      // await messages.add({
      //   'Lab Results' : FieldValue.arrayUnion([info]),
      // });
      messages.collection('info_Patients/$currentUser/lab Results').add({
        // 'uid' : currentUser,
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
      // await messages.doc().get().then((value){
      //   documentSnapshot = value;
      // });
      // var id = documentSnapshot['uid'];
      List<LabResultModel> messageList = [];
      // if(id.toString() == currentUser) {
        for (var doc in event.docs) {
          messageList.add(LabResultModel.fromJson(doc));
        }
        return right(messageList);
      // } else{
      //   return right(messageList);
      // }
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

}