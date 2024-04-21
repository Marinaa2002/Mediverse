import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/admin.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientState.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/FetechAdminInformationRepo.dart';
import 'package:meta/meta.dart';

class FetechPatientInfoCubit extends Cubit<FetechPatientInfoState> {
  FetechPatientInfoCubit(this.getPatientInfoRepo)
      : super(FetechPatientInfoStateInitial());
  final GetPatientInfoRepo getPatientInfoRepo;

  Future<void> getPatientInforCubitFunction(String id) async {
    emit(FetechPatientInfoStateLoading());
    var data = await getPatientInfoRepo.getPatientInfoFunction(id);
    data.fold(
        (left) => emit(FetechPatientInfoStateFailure(
              errMsg: left.errMsg,
            )), (right) {
      emit(FetechPatientInfoStateSuccess(patient: right));
    });
  }
}
