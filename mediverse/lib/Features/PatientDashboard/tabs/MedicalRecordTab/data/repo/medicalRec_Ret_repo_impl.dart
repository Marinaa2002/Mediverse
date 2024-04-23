import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/PatientDashboard/tabs/MedicalRecordTab/data/repo/medicalRec_Ret_repo.dart';

class RetrDataRepoImpl extends RetrDataRepo {
  @override
  Future<List<Map<String, dynamic>>> retrData() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      DocumentSnapshot userDocSnapshot = await FirebaseFirestore.instance
          .collection('info_Patients')
          .doc(currentUser.uid)
          .get();

      if (userDocSnapshot.exists) {
        List<Map<String, dynamic>> medicalRecords =
        List<Map<String, dynamic>>.from(
            userDocSnapshot['Medical Records'] ?? []);
        return medicalRecords;
      } else {
        print('Document does not exist');
        return [];
      }
    } else {
      print('Current user is null');
      return [];
    }
  }
}
