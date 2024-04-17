import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/admin.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/FetechAdminInformationRepo.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/FetechAdminInfoCubit.dart/fetech_admin_info_cubit.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/data/repos/FetechHMInformationRepo.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/presentation/Manager/FetechHospitalMangementCubit/fetech_HM_info_State.dart';
import 'package:meta/meta.dart';

class FetecHMInfoCubit extends Cubit<FetechHMInfoState> {
  FetecHMInfoCubit(this.getHMinfo) : super(FetechHMInfoStateInitial());
  final FetechHMRepo getHMinfo;

  Future<void> getHMInforCubitFunction(String id) async {
    emit(FetechHMInfoStateLoading());
    var data = await getHMinfo.getHMInfoFunction(id);
    data.fold(
        (left) => emit((FetechHMInfoStateFailure(
              errMsg: left.errMsg,
            ))), (right) {
      emit(FetechHMInfoStateSuccess(staffModel: right));
    });
  }
}
