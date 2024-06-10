import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Features/DoctorDashboard/BookingDoctor/data/repos/doc_bookings_repo_impl.dart';
import 'package:meta/meta.dart';

part 'doc_bookings_state.dart';

class DocBookingsCubit extends Cubit<DocBookingsState> {
  DocBookingsCubit(this.docBookingsRepoImpl) : super(DocBookingsInitial());

  final DocBookingsRepoImpl docBookingsRepoImpl;

  void getDocPrevBookings(String doctor_id) async {
    emit(DocBookingsLoading());
    var bookings_result = await docBookingsRepoImpl.getAppointments(doctor_id);
    bookings_result.fold(
      (left) => emit(DocBookingsFailure()),
      (right) async {
        right.reversed;
        var names_result = await docBookingsRepoImpl.getPatientNames(right);
        names_result.fold(
          (l) => emit(DocBookingsFailure()),
          (r) => emit(DocBookingsSuccess(bookings: right, names: r)),
        );
      },
    );
  }

  void searchDocPrevBookings(
      List<Booking> bookings, List<String> names, String searchText) {
    emit(DocBookingsLoading());
    if (bookings.isEmpty) {
      emit(DocBookingsSuccess(bookings: [], names: []));
    } else {
      List<int> indexes = [];
      for (int i = 0; i < names.length; i++) {
        String temp = names[i];
        if ((temp.toLowerCase()).contains(searchText.toLowerCase())) {
          indexes.add(i);
        }
      }
      List<Booking> newBookings = [];
      List<String> newNames = [];
      for (int index in indexes) {
        newBookings.add(bookings[index]);
        newNames.add(names[index]);
      }
      emit(DocBookingsSearch(
          newBookings: newBookings,
          newNames: newNames,
          bookings: bookings,
          names: names));
    }
  }
}
