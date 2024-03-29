import 'package:cloud_firestore/cloud_firestore.dart';

import 'SignUp_repo.dart';

class SignUpDocInfoRepoImpl extends SignUpDocInfoRepo{
  CollectionReference details = FirebaseFirestore.instance.collection('info_Doctors');

  @override
  signUpInfoDoctor({required String? uid, required String name, required String age, required String email, required String national_id, required String hospital, required String licNo,required String speciality}) async {
    if(uid != null) {
      try {
        await details.doc(uid).set({
          'Name': name,
          'Age': age,
          'Email': email,
          'NationalId': national_id,
          'Speciality': speciality,
          'Hospital': hospital,
          'License_Number': licNo,
          'Blogs': [],
          'Bookings': [],
          'Clinics': [],
          'Patients': [],
          'Phone': null,
          'Profile Picture': null,
          'Previous Appointments': [],
          'Rating': null,
          'Reviews': [],
          'Slots': [],
          'State': null,
          'Status': null
        });
      } on Exception catch (e) {
        print("Error adding document: $e");
      }
    }
  }

}