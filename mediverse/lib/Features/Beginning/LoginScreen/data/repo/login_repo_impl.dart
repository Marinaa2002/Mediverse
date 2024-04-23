import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/data/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  Future<Either<Failure, UserCredential>> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('user not Found');
        return left(ServerFailure(errMsg: 'user not Found'));
      } else if (e.code == 'invalid-credential') {
        print('Wrong Password');
        return left(ServerFailure(errMsg: 'Wrong email or wrong Password '));
      } else {
        // Handle other FirebaseAuthException codes if necessary
        return left(
            ServerFailure(errMsg: 'Authentication failed: ${e.message}'));
      }
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      var res =
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(res);
    } on Exception catch (e) {
      return left(ServerFailure(errMsg: 'Please enter a valid email'));
    }
  }
}
