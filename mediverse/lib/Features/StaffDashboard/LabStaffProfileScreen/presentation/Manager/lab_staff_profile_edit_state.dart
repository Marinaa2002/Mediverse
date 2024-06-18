part of 'lab_staff_profile_edit_cubit.dart';

@immutable
abstract class LabStaffProfileEditState {}

class LabStaffProfileEditInitial extends LabStaffProfileEditState {}
class LabStaffProfileEditLoading extends LabStaffProfileEditState {}
class LabStaffProfileEditSuccess extends LabStaffProfileEditState {}
class LabStaffProfileEditFailure extends LabStaffProfileEditState {
  String errMsg;
  LabStaffProfileEditFailure(this.errMsg);
}

