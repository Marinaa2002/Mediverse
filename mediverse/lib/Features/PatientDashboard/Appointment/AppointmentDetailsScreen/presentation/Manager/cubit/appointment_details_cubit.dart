import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/appointment_det_repo.dart';
import 'package:meta/meta.dart';

part 'appointment_details_state.dart';

class AppointmentDetailsCubit extends Cubit<AppointmentDetailsState> {
  AppointmentDetailsCubit(this.ADrepo) : super(AppointmentDetailsInitial());

  AppointmentDetailsRepo ADrepo;

  void fetchDoctorInfo(String doctorID) async {
    emit(AppointmentDetailsLoading());
    var doctor = await ADrepo.fetchDoctorInfo(doctorID);
    doctor.fold((failure) {
      emit(AppointmentDetailsFail());
    }, (doctor) {
      emit(AppointmentDetailsSuccess(doctor));
    });
  }
}
