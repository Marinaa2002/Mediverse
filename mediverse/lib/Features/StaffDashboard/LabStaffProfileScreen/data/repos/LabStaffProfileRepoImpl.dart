import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'LabStaffProfileRepo.dart';


class LabStaffProfileRepoImpl extends LabStaffProfileRepo {
  CollectionReference details =
  FirebaseFirestore.instance.collection("Staff");


  @override
  updateName({
    required String? name,
  }) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!.uid;
      await details.doc(currentUser).update({
        'Name': name,
      });
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updatePicture({required String? picture}) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!.uid;
      await details.doc(currentUser).update({'Profile_Picture': picture});
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updateLocation({required String? location}) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!.uid;
      await details.doc(currentUser).update({
        'Location': location,
      });
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updateOrgName({required String? orgName}) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!.uid;
      await details.doc(currentUser).update({
        'Org Name': orgName,
      });
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updateOrgType({required String? orgType}) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!.uid;
      await details.doc(currentUser).update({
        'Org Type': orgType,
      });
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }
}
