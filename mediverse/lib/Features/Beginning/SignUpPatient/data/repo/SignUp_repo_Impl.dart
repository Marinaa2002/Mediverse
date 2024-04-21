import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/AllModels/patient.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/data/repo/SignUp_repo.dart';

class SignUpInfoRepoImpl extends SignUpInfoRepo {
  CollectionReference details =
      FirebaseFirestore.instance.collection('info_Patients');

  @override
  signUpInfoPatient({required Patient patient}) async {
    await details.add({
      'id': patient.id,
      'Name': patient.Name,
      'Age': patient.Age,
      'Email': patient.Email,
      'Phone Number': patient.Phone,
      'NationalId': patient.National_id,
      'Bookings': [],
      'Doctor Notes': [],
      'Doctors': [],
      'Lab Results': [],
      'Medical Prescriptions': [],
      'Medical Records': [],
      'Profile Picture': null,
      'Phone': null
    });
  }
}
