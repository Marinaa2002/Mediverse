part of 'booking_history_cubit.dart';

@immutable
sealed class BookingHistoryState {}

final class BookingHistoryInitial extends BookingHistoryState {}

final class BookingHistoryLoading extends BookingHistoryState {}

final class BookingHistorySuccess extends BookingHistoryState {
  BookingHistorySuccess({required this.bookings, required this.doctorNames});
  List<Booking> bookings;
  List<String> doctorNames;
}

final class BookingHistoryFailure extends BookingHistoryState {}
