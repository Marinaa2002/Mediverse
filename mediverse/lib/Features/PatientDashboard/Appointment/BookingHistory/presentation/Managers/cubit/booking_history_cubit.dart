import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/BookingCard.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingHistory/data/repos/booking_history_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/DeleteBookingCard.dart';

part 'booking_history_state.dart';

class BookingHistoryCubit extends Cubit<BookingHistoryState> {
  BookingHistoryCubit(this.bookingHistoryRepoImpl)
      : super(BookingHistoryInitial());

  final BookingHistoryRepoImpl bookingHistoryRepoImpl;

  void getBookingHistory(String patient_id) async {
    emit(BookingHistoryLoading());
    var bookings_result = await bookingHistoryRepoImpl.getBookings(patient_id);
    bookings_result.fold(
      (left) => emit(BookingHistoryFailure()),
      (right) async {
        right.reversed;
        var names_result = await bookingHistoryRepoImpl.getDoctorNames(right);
        names_result.fold(
          (l) => emit(BookingHistoryFailure()),
          (r) => emit(BookingHistorySuccess(bookings: right, doctorNames: r)),
        );
      },
    );
  }

  List<Widget> makeBookingsWidgets(
      List<Booking> bookings, List<String> doctorNames) {
    List<Widget> bookingWidgets = [];
    for (int i = 0; i < bookings.length; i++) {
      if (bookings[i].State == 'paid in visa' ||
          bookings[i].State == 'paid in cash') {
        bookingWidgets.insert(
          0,
          DelBookingCard(
            booking: bookings[i],
            doctor_name: doctorNames[i],
          ),
        );
      } else {
        bookingWidgets.add(BookingCard(
            booking: bookings[i],
            name: doctorNames[i],
            displayPatientName: false));
      }
    }
    return bookingWidgets;
  }

  void deleteBooking(
    List<Booking> bookingsList,
    List<String> namesList,
    Booking booking,
  ) async {
    emit(BookingHistoryLoading());
    var result = await bookingHistoryRepoImpl.deleteBooking(booking);
    result.fold(
      (l) => emit(BookingHistoryFailure()),
      (r) {
        int bookingIndex = -1;
        for (int i = 0; i < bookingsList.length; i++) {
          if (bookingsList[i].id == booking.id) bookingIndex = i;
        }
        bookingsList.removeAt(bookingIndex);
        namesList.removeAt(bookingIndex);
        emit(
          BookingHistorySuccess(
            bookings: bookingsList,
            doctorNames: namesList,
          ),
        );
      },
    );
  }
}
