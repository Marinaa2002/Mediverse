import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/SlotsModel.dart';

sealed class SlotsState {}

final class SlotsStateInital extends SlotsState {}

final class SlotsStateLoading extends SlotsState {}

final class SlotsStateSuccess extends SlotsState {
  final List<SlotsModel> slots;

  SlotsStateSuccess({required this.slots});
}

final class SlotsStateEmpty extends SlotsState {}

final class SlotsStateFailure extends SlotsState {
  final String errMessage;

  SlotsStateFailure(this.errMessage);
}
