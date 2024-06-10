import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'AdminProfileRepo.dart';

class AdminProfileRepoImpl extends AdminProfileRepo {
  CollectionReference details =
  FirebaseFirestore.instance.collection("Admins");
  User? user = FirebaseAuth.instance.currentUser;
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
  updatePhoneNum({
    required String? phoneNum,
  }) async {
    try {
      await details.doc(currentUser).update({'Phone': phoneNum});
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updatePicture({required String? picture}) async {
    try {
      await details.doc(currentUser).update({'imageUrl': picture});
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }

  @override
  updateEmail({required String? email}) async {
    try {
      await details.doc(currentUser).update({'Email': email});
      if (user != null) {
        try {
          await user!.updateEmail(email!);
        } on Exception catch (e) {
          print("Error adding document: $e");
        }
      }
    } on Exception catch (e) {
      print("Error adding document: $e");
    }
  }
}
