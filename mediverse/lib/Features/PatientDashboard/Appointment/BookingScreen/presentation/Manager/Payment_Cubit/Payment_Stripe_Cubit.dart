import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/repos/Check_out_repo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Manager/Payment_Cubit/Payment_Stripe_States.dart';

import 'package:meta/meta.dart';

import '../../../data/models/PaymentIndentInputModel.dart';

class PaymentCubit extends Cubit<PaymentStripeState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentStripeInitial());
  final CheckoutRepo checkoutRepo;
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentStripeLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (left) => emit(PaymentStripeFailure(left.errMsg)),
      (right) => emit(
        PaymentStripeSuccess(),
      ),
    );
  }

  @override
  void onChange(Change<PaymentStripeState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
