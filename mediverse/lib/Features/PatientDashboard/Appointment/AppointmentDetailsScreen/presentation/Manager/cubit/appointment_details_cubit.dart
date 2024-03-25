import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/appointment_det_repo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/appointment_det_repo_impl.dart';
import 'package:meta/meta.dart';

part 'appointment_details_state.dart';

class AppointmentDetailsCubit extends Cubit<AppointmentDetailsState> {
  AppointmentDetailsCubit() : super(AppointmentDetailsInitial());

  final AppointmentDetailsRepo ADrepo = AppointmentDetailsRepoImpl();

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
