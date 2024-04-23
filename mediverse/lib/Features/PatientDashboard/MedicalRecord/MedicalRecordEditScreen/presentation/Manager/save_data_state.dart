part of 'save_data_cubit.dart';

@immutable
abstract class SaveDataState {

}

class SaveDataInitial extends SaveDataState {}

class SaveDataLoading extends SaveDataState {}

class SaveDataSuccess extends SaveDataState {

}

class SaveDataFailure extends SaveDataState {
  String errMsg;
  SaveDataFailure({required this.errMsg});
}

