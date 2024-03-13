sealed class SlotsState {}

final class SlotsStateInital extends SlotsState {}

final class SlotsStateLoading extends SlotsState {}

final class SlotsStateSuccess extends SlotsState {}

final class SlotsStateFailure extends SlotsState {
  final String errMessage;

  SlotsStateFailure(this.errMessage);
}
