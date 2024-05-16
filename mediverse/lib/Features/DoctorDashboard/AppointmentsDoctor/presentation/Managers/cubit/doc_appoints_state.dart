part of 'doc_appoints_cubit.dart';

@immutable
sealed class DocAppointsState {}

final class DocAppointsInitial extends DocAppointsState {}

final class DocAppointsSuccess extends DocAppointsState {
  DocAppointsSuccess({
    required this.bookings,
  });
  List<Booking> bookings;
}

final class DocAppointsFailed extends DocAppointsState {}
