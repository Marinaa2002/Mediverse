part of 'doc_appoints_cubit.dart';

@immutable
sealed class DocAppointsState {}

final class DocAppointsInitial extends DocAppointsState {}

final class DocAppointsSuccess extends DocAppointsState {
  DocAppointsSuccess({
    required this.bookings,
    required this.names,
  });
  List<Booking> bookings;
  List<String> names;
}

final class DocAppointsFailed extends DocAppointsState {}

final class DocAppointsLoading extends DocAppointsState {}
