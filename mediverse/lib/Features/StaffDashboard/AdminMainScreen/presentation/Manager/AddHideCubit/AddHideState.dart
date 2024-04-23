sealed class AddHideState {}

final class AddHideStateInitial extends AddHideState {}

final class AddHideStateLoading extends AddHideState {}

final class AddHideStateSuccess extends AddHideState {
  final bool value;
  AddHideStateSuccess(this.value);
}

final class AddHideStateFailure extends AddHideState {
  final String errMsg;

  AddHideStateFailure({required this.errMsg});
}
