import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Features/DoctorDashboard/BookingDoctor/data/repos/doc_bookings_repo_impl.dart';
import 'package:meta/meta.dart';

part 'doc_bookings_state.dart';

class DocBookingsCubit extends Cubit<DocBookingsState> {
  DocBookingsCubit(this.docBookingsRepoImpl) : super(DocBookingsInitial());

  final DocBookingsRepoImpl docBookingsRepoImpl;

  void getDocPrevBookings(String doctor_id) async{
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
}
