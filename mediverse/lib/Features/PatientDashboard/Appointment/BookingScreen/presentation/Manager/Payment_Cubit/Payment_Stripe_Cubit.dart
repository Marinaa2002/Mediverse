import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/repos/Check_out_repo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Manager/Payment_Cubit/Payment_Stripe_States.dart';

import '../../../data/models/PaymentIndentInputModel.dart';

class PaymentStripeCubit extends Cubit<PaymentStripeState> {
  PaymentStripeCubit(this.checkoutRepo) : super(PaymentStripeStateInitial());
  final CheckOutRepo checkoutRepo;
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentStripeStateLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (left) => emit(PaymentStripeStateFailure(left.errMsg)),
      (right) => emit(
        PaymentStripeStateSuccess(),
      ),
    );
  }

  @override
  void onChange(Change<PaymentStripeState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
