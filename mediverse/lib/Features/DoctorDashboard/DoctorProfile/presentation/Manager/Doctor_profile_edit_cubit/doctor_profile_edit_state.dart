part of 'doctor_profile_edit_cubit.dart';

@immutable
abstract class DoctorProfileEditState {}

class DoctorProfileEditInitial extends DoctorProfileEditState {}
class DoctorProfileEditLoading extends DoctorProfileEditState {}
class DoctorProfileEditSuccess extends DoctorProfileEditState {}
class DoctorProfileEditFailure extends DoctorProfileEditState {
  String errMsg;
  DoctorProfileEditFailure(this.errMsg);
}
