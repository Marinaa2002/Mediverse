part of 'lab_result_cubit.dart';

@immutable
abstract class LabResultState {}

class LabResultInitial extends LabResultState {}
class LabResultLoading extends LabResultState {}
class LabResultSuccess extends LabResultState {
  List<LabResultModel> labModelList;

  LabResultSuccess({required this.labModelList});
}
class LabResultFailure extends LabResultState {
  String errMessage;
  LabResultFailure(this.errMessage);
}