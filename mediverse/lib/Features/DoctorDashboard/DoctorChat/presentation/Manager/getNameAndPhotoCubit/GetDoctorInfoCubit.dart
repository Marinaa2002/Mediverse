import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/repos/getDoctorInfoRepo.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoStates.dart';
import 'package:meta/meta.dart';

class GetDoctorInfoCubit extends Cubit<GetDoctorInfoState> {
  final GetDoctorInfoRepo getDoctorInfo;
  GetDoctorInfoCubit(this.getDoctorInfo) : super(GetDoctorInfoInitial());
  Future<void> getDoctorInforCubitFunction(String id) async {
    emit(GetDoctorInfoLoading());
    var data = await getDoctorInfo.getDoctorInfoFunction(id);
    data.fold(
        (left) => emit(GetDoctorInfoFailure(
              errMsg: left.errMsg,
            )), (right) {
      emit(GetDoctorInfoSuccess(doctor: right));
    });
  }

  @override
  void onChange(Change<GetDoctorInfoState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
