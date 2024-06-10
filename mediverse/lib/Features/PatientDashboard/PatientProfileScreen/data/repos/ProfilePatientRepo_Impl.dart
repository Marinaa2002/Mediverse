import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ProfilePatientRepo.dart';

class ProfilePatientRepoImpl extends ProfilePatientRepo {
  CollectionReference details =
      FirebaseFirestore.instance.collection("info_Patients");
  CollectionReference details2 =
  FirebaseFirestore.instance.collection("Patient_Profile");
  final currentUser = FirebaseAuth.instance.currentUser!.uid;

  @override
  updateName({
    required String? name,
  }) async {
    try {
      await details.doc(currentUser).update({
        'Name': name,
      });
      await details2.doc(currentUser).update({
        'Name': name,
      });
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updateAge({
    required String? age,
  }) async {
    try {
      await details.doc(currentUser).update({
        'Age': age,
      });
      await details2.doc(currentUser).update({
        'Age': age,
      });
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updateNationalId({
    required String? nationalId,
  }) async {
    try {
      await details.doc(currentUser).update({
        'NationalId': nationalId,
      });
      await details2.doc(currentUser).update({
        'NationalId': nationalId,
      });
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updatePhoneNum({
    required String? phoneNum,
  }) async {
    try {
      await details.doc(currentUser).update({'Phone Number': phoneNum});
      await details2.doc(currentUser).update({'Phone Number': phoneNum});
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updatePicture({required String? picture}) async {
    try {
      await details.doc(currentUser).update({'Profile Picture': picture});
      await details2.doc(currentUser).update({'Profile Picture': picture});
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }
}
