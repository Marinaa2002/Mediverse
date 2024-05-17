import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Features/DoctorDashboard/AppointmentsDoctor/data/repos/doc_appoints_repo_impl.dart';
import 'package:meta/meta.dart';

part 'doc_appoints_state.dart';

class DocAppointsCubit extends Cubit<DocAppointsState> {
  DocAppointsCubit(this.docAppointsRepoImpl) : super(DocAppointsInitial());

  final DocAppointsRepoImpl docAppointsRepoImpl;

  void getBookingsList(String doctor_id) async {
    emit(DocAppointsLoading());
    var bookings_result = await docAppointsRepoImpl.getBookings(doctor_id);
    bookings_result.fold(
      (left) => emit(DocAppointsFailed()),
      (right) async {
        var names_result = await docAppointsRepoImpl.getPatientNames(right);
        names_result.fold(
          (l) => emit(DocAppointsFailed()),
          (r) => emit(DocAppointsSuccess(bookings: right, names: r)),
        );
      },
    );
  }
}
