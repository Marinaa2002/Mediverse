import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Features/DoctorDashboard/AppointmentsDoctor/data/repos/doc_appoints_repo_impl.dart';
import 'package:meta/meta.dart';

part 'doc_appoints_state.dart';

class DocAppointsCubit extends Cubit<DocAppointsState> {
  DocAppointsCubit(this.docAppointsRepoImpl) : super(DocAppointsInitial());

  final DocAppointsRepoImpl docAppointsRepoImpl;

  // custom order for weekdays
  final Map<String, int> weekdayOrder = {
    'Saturday': 0,
    'Sunday': 1,
    'Monday': 2,
    'Tuesday': 3,
    'Wednesday': 4,
    'Thursday': 5,
    'Friday': 6,
  };

  void getBookingsList(String doctor_id) async {
    emit(DocAppointsLoading());
    var bookings_result = await docAppointsRepoImpl.getBookings(doctor_id);
    bookings_result.fold(
      (left) => emit(DocAppointsFailed()),
      (right) async {
        // Sort the list using the custom order
        right.sort(
            (a, b) => weekdayOrder[a.Day]!.compareTo(weekdayOrder[b.Day]!));
        var names_result = await docAppointsRepoImpl.getPatientNames(right);
        names_result.fold(
          (l) => emit(DocAppointsFailed()),
          (r) => emit(DocAppointsSuccess(bookings: right, names: r)),
        );
      },
    );
  }

  void changeBookingStatus(
    List<Booking> bookingsList,
    List<String> namesList,
    Booking booking,
  ) async {
    var result = await docAppointsRepoImpl.moveToPrevAppoints(booking);
    result.fold(
      (l) => emit(DocAppointsFailed()),
      (r) {
        int bookingIndex = -1;
        for (int i = 0; i < bookingsList.length; i++) {
          if (bookingsList[i].id == booking.id) bookingIndex = i;
        }
        bookingsList.removeAt(bookingIndex);
        namesList.removeAt(bookingIndex);
        emit(DocAppointsSuccess(bookings: bookingsList, names: namesList));
      },
    );
  }
}
