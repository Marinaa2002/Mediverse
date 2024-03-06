import 'package:cloud_firestore/cloud_firestore.dart';

import 'StaffRepo.dart';

class StaffRepoImpl extends StaffRepo {
  CollectionReference details = FirebaseFirestore.instance.collection('Form_Requests_Info');

  @override
  sendRequest({
    required String staff,
    required String orgName,
    required String orgType,
    required String licNo,
    required String loc,
    required String email,
  }) async {
    try {
      await details.add({
        'Staff': staff,
        'Org Name': orgName,
        'Org Type': orgType,
        'Location': loc,
        'License_Number': licNo,
        'Email':email
      });
    }on Exception catch (e) {

    }
  }
}
