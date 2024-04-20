import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mediverse/Features/Beginning/LoginScreen/data/repo/login_repo.dart';

import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      var result = await loginRepo.loginUser(email: email!, password: password!);
      result.fold((left) => emit(LoginFailure(left.errMsg)),
              (right) =>
                  emit(LoginSuccess()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('user not Found');
        emit(LoginFailure('user not Found'));
      } else if (e.code == 'wrong-password') {
        print('Wrong Password');
        emit(LoginFailure('Wrong Password'));
      }
    } catch (e) {
      print('Something went wrong');
      emit(LoginFailure('Something went wrong'));
    }
  }

}









