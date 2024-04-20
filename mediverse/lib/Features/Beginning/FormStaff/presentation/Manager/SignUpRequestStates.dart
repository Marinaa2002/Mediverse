abstract class SignUpStaffState {}

class SignUpStaffInitial extends SignUpStaffState {}

class SignUpStaffLoading extends SignUpStaffState {}

class SignUpStaffSuccess extends SignUpStaffState {}

class SignUpStaffFailure extends SignUpStaffState {
  String errMsg;
  SignUpStaffFailure({required this.errMsg});
}
