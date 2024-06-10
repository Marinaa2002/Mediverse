import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'StaffProfileRepo.dart';


class StaffProfileRepoImpl extends StaffProfileRepo {
  CollectionReference details =
  FirebaseFirestore.instance.collection("Staff");
  final currentUser = FirebaseAuth.instance.currentUser!.uid;

  @override
  updateName({
    required String? name,
  }) async {
    try {
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
      await details.doc(currentUser).update({'Profile_Picture': picture});
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updateLocation({required String? location}) async {
    try {
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
      await details.doc(currentUser).update({
        'Org Type': orgType,
      });
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }
}
