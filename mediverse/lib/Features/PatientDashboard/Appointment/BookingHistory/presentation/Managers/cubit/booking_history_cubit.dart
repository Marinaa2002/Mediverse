import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingHistory/data/repos/booking_history_repo_impl.dart';
import 'package:meta/meta.dart';

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
}
