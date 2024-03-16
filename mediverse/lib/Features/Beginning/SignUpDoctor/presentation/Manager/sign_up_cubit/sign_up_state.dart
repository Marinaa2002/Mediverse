part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpDocState {}

class SignUpDocInitial extends SignUpDocState {}

class SignUpDocLoading extends SignUpDocState {}

class SignUpDocSuccess extends SignUpDocState {

}

class SignUpDocFailure extends SignUpDocState {
  String errMsg;
  SignUpDocFailure({required this.errMsg});
}
