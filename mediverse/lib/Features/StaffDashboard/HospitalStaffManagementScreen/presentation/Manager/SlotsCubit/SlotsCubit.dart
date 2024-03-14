import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/repos/Check_out_repo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Manager/Payment_Cubit/Payment_Stripe_States.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Manager/SlotsCubit/SlotsStates.dart';

class SlotsReterivalCubit extends Cubit<SlotsState> {
  SlotsReterivalCubit(this.checkoutRepo) : super(SlotsStateInital());
  final CheckoutRepo checkoutRepo;
  // Future makePayment(
  //     {required PaymentIntentInputModel paymentIntentInputModel}) async {
  //   emit(SlotsStateLoading());
  //   var data = await checkoutRepo.makePayment(
  //       paymentIntentInputModel: paymentIntentInputModel);
  //   data.fold(
  //     (left) => emit(SlotsStateFailure(left.errMsg)),
  //     (right) => emit(
  //       SlotsStateSuccess(),
  //     ),
  //   );
  // }

  @override
  void onChange(Change<SlotsState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
