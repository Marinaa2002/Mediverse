import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'medicalRepo_rep.dart';

class SaveDataRepoImpl extends SaveDataRepo {
  @override
  Future<void> saveData({
    required String height,
    required String weight,
    required String bloodType,
    required String bloodPressure,
    required String bloodGlucoseLevel,
    required String cholesterolLevels,
    required String allergies,
    required String heartRate,
    required String respiratoryRate,
    required String temperature,
    required String surgicalHistory,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      DocumentReference userDocRef = FirebaseFirestore.instance.collection('info_Patients').doc(currentUser.uid);

      bool docExists = await userDocRef.get().then((doc) => doc.exists);

      if (docExists) {
        List<Map<String, dynamic>> medicalRecords =
        [
          {
            'Height': height,
            'Weight': weight,
            'Blood Type': bloodType,
            'Blood Pressure': bloodPressure,
            'Blood Glucose Level': bloodGlucoseLevel,
            'Cholesterol Levels': cholesterolLevels,
            'Allergies': allergies,
            'Heart Rate': heartRate,
            'Respiratory Rate': respiratoryRate,
            'Temperature': temperature,
            'Surgical History': surgicalHistory,
          }
        ];

        await userDocRef.update({
          'Medical Records': FieldValue.arrayUnion(medicalRecords),
        });
      } else {
        print('Document does not exist');
      }
    }
  }
}
