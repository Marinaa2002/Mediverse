import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/AllModels/requestModel.dart';

import 'StaffRepo.dart';

class StaffRepoImpl extends StaffRepo {
  CollectionReference details =
      FirebaseFirestore.instance.collection('Form_Requests_Info');

  @override
  sendRequest({required RequestModel requestModel, required String id}) async {
    try {
      await details.doc(id).set({
        'Staff': requestModel.staff,
        'Org Name': requestModel.orgName,
        'Org Type': requestModel.orgType,
        'Location': requestModel.location,
        'License_Number': requestModel.licenseNumber,
        'Email': requestModel.email,
        'Status': requestModel.status,
        'Name': requestModel.name,
        'Phone Number': requestModel.phoneNum
      });
    } on Exception catch (e) {}
  }
}
