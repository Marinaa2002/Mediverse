import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/data/repo/SignUp_repo.dart';

class SignUpInfoRepoImpl extends SignUpInfoRepo{
  CollectionReference details = FirebaseFirestore.instance.collection('info_Patients');

  @override
  signUpInfoPatient({required String name, required String age, required String national_id}) {
    try {
      details.add({
        'Name': name,
        'Age':age ,
        'NationalId' :national_id ,
      });
    } on Exception catch (e) {

    }
  }

}