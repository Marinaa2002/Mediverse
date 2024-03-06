import 'package:cloud_firestore/cloud_firestore.dart';

import 'SignUp_repo.dart';

class SignUpDocInfoRepoImpl extends SignUpDocInfoRepo{
  CollectionReference details = FirebaseFirestore.instance.collection('info_Doctors');

  @override
  signUpInfoDoctor({required String name, required String age, required String national_id, required String hospital, required String licNo,required String speciality}) {
    try {
      details.add({
        'Name': name,
        'Age':age ,
        'NationalId' :national_id ,
        'Speciality' : speciality,
        'Hospital':hospital,
        'License_Number': licNo
      });
    } on Exception catch (e) {

    }
  }

}