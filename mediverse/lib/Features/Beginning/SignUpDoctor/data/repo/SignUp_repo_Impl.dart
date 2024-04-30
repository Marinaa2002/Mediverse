import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/AllModels/requestModel.dart';

import 'SignUp_repo.dart';

class SignUpDocInfoRepoImpl extends SignUpDocInfoRepo {
  CollectionReference details =
      FirebaseFirestore.instance.collection('Form_Requests_Info');

  @override
  signUpInfoDoctor(
      {required RequestModel requestModel, required String id}) async {
    // if(uid != null) {
    //   try {
    //     await details.doc(uid).set({
    //       'Name': name,
    //       'Age': age,
    //       'Email': email,
    //       'NationalId': national_id,
    //       'Speciality': speciality,
    //       'Hospital': hospital,
    //       'License_Number': licNo,
    //       'Blogs': [],
    //       'Bookings': [],
    //       'Clinics': [],
    //       'Patients': [],
    //       'Phone': phoneNum,
    //       'Profile Picture': null,
    //       'Previous Appointments': [],
    //       'Rating': null,
    //       'Reviews': [],
    //       'Slots': [],
    //       'State': null,
    //       'Status': "pending"
    //     });
    //   } on Exception catch (e) {
    //     print("Error adding document: $e");
    //   }
    // }
    await details.doc(id).set({
      'Staff': requestModel.staff,
      'Org Name': requestModel.orgName,
      'Org Type': requestModel.orgType,
      'Location': requestModel.location,
      'License_Number': requestModel.licenseNumber,
      'Email': requestModel.email,
      'Status': requestModel.status,
      'Age': requestModel.age,
      'Name': requestModel.name,
      'Specialty': requestModel.specialty,
      'Phone Number': requestModel.phoneNum,
      'National_Id': requestModel.national_id,
    });
  }
}
