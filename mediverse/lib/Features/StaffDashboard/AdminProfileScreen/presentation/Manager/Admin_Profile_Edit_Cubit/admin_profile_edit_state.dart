part of 'admin_profile_edit_cubit.dart';

@immutable
abstract class AdminProfileEditState {}

class AdminProfileEditInitial extends AdminProfileEditState {}
class AdminProfileEditLoading extends AdminProfileEditState {}
class AdminProfileEditSuccess extends AdminProfileEditState {}
class AdminProfileEditFailure extends AdminProfileEditState {
  String errMsg;
  AdminProfileEditFailure(this.errMsg);
}
