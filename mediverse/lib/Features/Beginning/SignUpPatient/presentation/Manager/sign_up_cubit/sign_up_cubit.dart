import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/data/models/patient.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/data/repo/SignUp_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/SignUp_repo_Impl.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  CollectionReference details = FirebaseFirestore.instance.collection('info_Patients');

  final SignUpInfoRepo signUpInfoRepo = SignUpInfoRepoImpl();

  Future<String?> signUpUser({required String email, required String password}) async{
    emit(SignUpLoading());
    try{
      UserCredential usercredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      User? firebaseuser = usercredential.user;
      if (firebaseuser != null) {
        emit(SignUpSuccess());
        return firebaseuser.uid;
      }
    }on FirebaseAuthException catch(ex){
      if (ex.code == 'weak-password') {
        emit(SignUpFailure(errMsg: 'weak-password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(SignUpFailure(errMsg:'email-already-in-use'));
      }
    }
  }

  Future<void> signUpInfoPatient({required String name, required String age, required String phoneNum, required String national_id, required String email, required String password}) async {
    emit(SignUpLoading());
    try{
      final uid = await signUpUser(email: email, password: password);
      signUpInfoRepo.signUpInfoPatient(uid: uid, name: name, age: age, phoneNum: phoneNum, email: email, national_id: national_id);
      emit(SignUpSuccess());
    } on Exception catch (e) {
      emit(SignUpFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

}
