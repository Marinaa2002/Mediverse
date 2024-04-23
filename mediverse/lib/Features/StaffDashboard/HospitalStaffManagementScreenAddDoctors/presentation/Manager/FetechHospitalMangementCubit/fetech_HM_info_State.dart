import 'package:mediverse/AllModels/Staff.dart';

sealed class FetechHMInfoState {}

final class FetechHMInfoStateInitial extends FetechHMInfoState {}

final class FetechHMInfoStateLoading extends FetechHMInfoState {}

final class FetechHMInfoStateSuccess extends FetechHMInfoState {
  final StaffModel staffModel;
  FetechHMInfoStateSuccess({required this.staffModel});
}

final class FetechHMInfoStateFailure extends FetechHMInfoState {
  final String errMsg;

  FetechHMInfoStateFailure({required this.errMsg});
}
