import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/repos/AvailableSlotsRepo.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Manager/SlotsCubit/SlotsStates.dart';

class SlotsReterivalCubit extends Cubit<SlotsState> {
  SlotsReterivalCubit(this.availableSlotsRepo) : super(SlotsStateInital());
  final AvailableSlotsRepo availableSlotsRepo;
  Future getSlots() async {
    emit(SlotsStateLoading());
    try {
      var data = await availableSlotsRepo
          .availableSlotsReterival(); // Call method on instance
      data.fold(
        (left) => emit(SlotsStateFailure(left.errMsg)),
        (right) {
          if (right.isEmpty) {
            emit(SlotsStateEmpty());
          } else {
            emit(SlotsStateSuccess(slots: right));
          }
        },
      );
    } catch (e) {
      emit(SlotsStateFailure(e.toString()));
    }
  }

  @override
  void onChange(Change<SlotsState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
