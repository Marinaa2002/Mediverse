import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/data/login_repo.dart';
import '../../../../Core/Errors/Failure.dart';


class LoginRepoImpl extends LoginRepo{
  Future<Either<Failure , UserCredential>> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      return right(user);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Something went wrong, Try again'));
    }
  }

  @override
  Future<Either<Failure , void>> forgetPassword({required String email}) async{
    try{
      var res = await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(res);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Please enter a valid email'));
    }
  }
}


