import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/AllModels/requestModel.dart';
import 'package:mediverse/Features/Beginning/FormStaff/data/repo/StaffRepoImpl.dart';
import 'package:meta/meta.dart';

part 'staff_request_state.dart';

class StaffRequestCubit extends Cubit<StaffRequestState> {
  StaffRequestCubit() : super(StaffRequestInitial());
  final StaffRepoImpl staffRepo = StaffRepoImpl();
  CollectionReference details =
      FirebaseFirestore.instance.collection('Form_Request_Info');
  CollectionReference metaData =
      FirebaseFirestore.instance.collection('MetaData');
  Future<String?> signUpStaffUser(
      {required String email, required String password}) async {
    emit(StaffRequestLoading());
    try {
      UserCredential usercredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseuser = usercredential.user;
      if (firebaseuser != null) {
        emit(StaffRequestSuccess());
        return firebaseuser.uid;
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(StaffRequestFailure(errMsg: 'weak-password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(StaffRequestFailure(errMsg: 'email-already-in-use'));
      }
    }
    return null;
  }

  Future<void> sendRequest({
    required String email,
    required String staff,
    required String orgName,
    required String orgType,
    required String licNo,
    required String loc,
    required String name,
  }) async {
    emit(StaffRequestLoading());
    try {
      // DocumentReference patientref = await metaData.add({
      //   'type': staff,
      //   'email': email,
      //   'status': 'hide',
      //   // 'status':'Show'
      // });
      RequestModel requestModel = new RequestModel(
          email: email,
          staff: staff,
          orgName: orgName,
          orgType: orgType,
          licenseNumber: licNo,
          location: loc,
          name: name,
          status: "pending");
      staffRepo.sendRequest(
        requestModel: requestModel,
      );
      emit(StaffRequestSuccess());
    } on Exception catch (e) {
      emit(StaffRequestFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}
