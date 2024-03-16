part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordLoading extends ForgetPasswordState {}
class ForgetPasswordSuccess extends ForgetPasswordState {}
class ForgetPasswordFailure extends ForgetPasswordState {
  String errMessage;
  ForgetPasswordFailure(this.errMessage);
}