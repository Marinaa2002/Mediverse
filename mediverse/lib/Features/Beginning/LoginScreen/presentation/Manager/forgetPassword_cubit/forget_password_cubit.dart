import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../../data/repo/login_repo.dart';


part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.loginRepo) : super(ForgetPasswordInitial());

  final LoginRepo loginRepo;

  Future<void>  forgetPassword({required String email}) async{
    emit(ForgetPasswordLoading());
    try {
      var result = await loginRepo.forgetPassword(email: email);
      result.fold((left) => emit(ForgetPasswordFailure(left.errMsg)),
              (right) =>
              emit(ForgetPasswordSuccess()));
    } catch (e) {
      print('Something went wrong');
      emit(ForgetPasswordFailure('Please enter a valid email'));
    }
  }
}
