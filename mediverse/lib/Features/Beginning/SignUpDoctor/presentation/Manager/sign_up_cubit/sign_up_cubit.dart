import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/data/repo/SignUp_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/SignUp_repo_Impl.dart';

part 'sign_up_state.dart';

class SignUpDocCubit extends Cubit<SignUpDocState> {
  SignUpDocCubit() : super(SignUpDocInitial());
  CollectionReference details = FirebaseFirestore.instance.collection('Info_Doctors');

  final SignUpDocInfoRepoImpl signUpInfoRepo = SignUpDocInfoRepoImpl();

  Future<void> signUpDocUser({required String email, required String password}) async{
    emit(SignUpDocLoading());
    try{
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      emit(SignUpDocSuccess());
    }on FirebaseAuthException catch(ex){
      if (ex.code == 'weak-password') {
        emit(SignUpDocFailure(errMsg: 'weak-password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(SignUpDocFailure(errMsg:'email-already-in-use'));
      }
    }
  }

  void signUpInfoDoctor({required String name, required String age, required String national_id, required String hospital, required String licNo,required String speciality}) {
    emit(SignUpDocLoading());
    try{
      signUpInfoRepo.signUpInfoDoctor(name: name, age: age, national_id: national_id, hospital: hospital, licNo: licNo, speciality: speciality);
      emit(SignUpDocSuccess());
    }on Exception catch (e) {
      emit(SignUpDocFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

}
