import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/data/repo/SignUp_repo.dart';

class SignUpInfoRepoImpl extends SignUpInfoRepo{
  CollectionReference details = FirebaseFirestore.instance.collection('info_Patients');

  @override
  signUpInfoPatient({required String? uid, required String name, required String age, required String email, required String national_id}) async {
    if(uid != null) {
      try {
        await details.doc(uid).set({
          'Name': name,
          'Age': age,
          'Email': email,
          'NationalId': national_id,
          'Bookings': [],
          'Doctor Notes': [],
          'Doctors': [],
          'Lab Results': [],
          'Medical Prescriptions': [],
          'Medical Records': [],
          'Profile Picture': null,
          'Phone': null
        });
      } on Exception catch (e) {
        print("Error adding document: $e");
      }
    }
  }
}