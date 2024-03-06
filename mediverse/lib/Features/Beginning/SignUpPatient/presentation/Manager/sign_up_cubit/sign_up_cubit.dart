import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/data/repo/SignUp_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/SignUp_repo_Impl.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  CollectionReference details = FirebaseFirestore.instance.collection('Info_Patients');

  final SignUpInfoRepo signUpInfoRepo = SignUpInfoRepoImpl();

  Future<void> signUpUser({required String email, required String password}) async{
    emit(SignUpLoading());
    try{
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      emit(SignUpSuccess());
    }on FirebaseAuthException catch(ex){
      if (ex.code == 'weak-password') {
        emit(SignUpFailure(errMsg: 'weak-password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(SignUpFailure(errMsg:'email-already-in-use'));
      }
    }
  }

  void signUpInfoPatient({ required String name, required String age, required String national_id}) {
    emit(SignUpLoading());
    try{
      signUpInfoRepo.signUpInfoPatient(name: name, age: age, national_id: national_id);
      emit(SignUpSuccess());
    } on Exception catch (e) {
      emit(SignUpFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

}
