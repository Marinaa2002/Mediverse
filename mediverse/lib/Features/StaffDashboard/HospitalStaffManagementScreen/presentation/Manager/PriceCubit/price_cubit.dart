import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/PricesModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/repos/PricesRepo.dart';
import 'package:meta/meta.dart';

part 'price_state.dart';

class PriceCubit extends Cubit<PriceCubitState> {
  PriceCubit(this.priceRepo) : super(PriceCubitInitial());
  final PriceRepo priceRepo;
  Future getPrices() async {
    emit(PriceCubitLoading());
    try {
      var data = await priceRepo.getPrices(); // Call method on instance
      data.fold(
        (left) => emit(PriceCubitFailure(left.errMsg)),
        (right) {
          if (right.cost == '0' && right.dUid == '0') {
            emit(PriceCubitEmpty());
          } else {
            emit(PriceCubitSuccess(priceModel: right));
          }
        },
      );
    } catch (e) {
      emit(PriceCubitFailure(e.toString()));
    }
  }

  @override
  void onChange(Change<PriceCubitState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
