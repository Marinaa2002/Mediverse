import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/Beginning/FormStaff/data/repo/StaffRepoImpl.dart';
import 'package:meta/meta.dart';

part 'staff_request_state.dart';

class StaffRequestCubit extends Cubit<StaffRequestState> {
  StaffRequestCubit() : super(StaffRequestInitial());
  final StaffRepoImpl staffRepo = StaffRepoImpl();
  CollectionReference details = FirebaseFirestore.instance.collection('Form_Request_Info');



  void sendRequest({required String email,required String staff, required String orgName, required String orgType, required String licNo, required String loc})
  {
    emit(StaffRequestLoading());
    try{
      staffRepo.sendRequest(staff: staff, orgName: orgName, orgType: orgType, licNo: licNo, loc: loc, email:email);
      emit(StaffRequestSuccess());
      }on Exception catch (e) {
      emit(StaffRequestFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}
