part of 'staff_request_cubit.dart';

@immutable
abstract class StaffRequestState {}

class StaffRequestInitial extends StaffRequestState {}
class StaffRequestLoading extends StaffRequestState{}
class StaffRequestSuccess extends StaffRequestState {

}

class StaffRequestFailure extends StaffRequestState {
  String errMsg;
  StaffRequestFailure({required this.errMsg});
}

