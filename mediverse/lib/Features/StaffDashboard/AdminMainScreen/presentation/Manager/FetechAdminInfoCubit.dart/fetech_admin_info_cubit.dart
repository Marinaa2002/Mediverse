import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/admin.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/FetechAdminInformationRepo.dart';
import 'package:meta/meta.dart';

part 'fetech_admin_info_state.dart';

class FetechAdminInfoCubit extends Cubit<FetechAdminInfoState> {
  FetechAdminInfoCubit(this.getAdminInfo) : super(FetechAdminInfoInitial());
  final GetAdminInfoRepo getAdminInfo;

  Future<void> getDoctorInforCubitFunction(String id) async {
    emit(FetechAdminInfoLoading());
    var data = await getAdminInfo.getAdminInfoFunction(id);
    data.fold(
        (left) => emit(FetechAdminInfoFailure(
              errMsg: left.errMsg,
            )), (right) {
      emit(FetechAdminInfoSuccess(admin: right));
    });
  }
}
