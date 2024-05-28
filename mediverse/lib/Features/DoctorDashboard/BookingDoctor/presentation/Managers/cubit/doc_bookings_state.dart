part of 'doc_bookings_cubit.dart';

@immutable
sealed class DocBookingsState {}

final class DocBookingsInitial extends DocBookingsState {}

final class DocBookingsSuccess extends DocBookingsState {
  DocBookingsSuccess({
    required this.bookings,
    required this.names,
  });

  List<Booking> bookings;
  List<String> names;
}


final class DocBookingsSearch extends DocBookingsSuccess {
  DocBookingsSearch({
    required this.newBookings,
    required this.newNames,
    required this.bookings,
    required this.names,
  }) : super(bookings: bookings, names: names);

  List<Booking> newBookings;
  List<String> newNames;
  List<Booking> bookings;
  List<String> names;
}

final class DocBookingsFailure extends DocBookingsState {}

final class DocBookingsLoading extends DocBookingsState {}
