part of 'staff_profile_edit_cubit.dart';

@immutable
abstract class StaffProfileEditState {}

class StaffProfileEditInitial extends StaffProfileEditState {}
class StaffProfileEditLoading extends StaffProfileEditState {}
class StaffProfileEditSuccess extends StaffProfileEditState {}
class StaffProfileEditFailure extends StaffProfileEditState {
  String errMsg;
  StaffProfileEditFailure(this.errMsg);
}

