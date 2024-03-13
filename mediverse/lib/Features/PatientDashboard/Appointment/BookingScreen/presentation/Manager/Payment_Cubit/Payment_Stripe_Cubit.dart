import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/repos/Check_out_repo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Manager/Payment_Cubit/Payment_Stripe_States.dart';

import '../../../data/models/PaymentIndentInputModel.dart';

class PaymentStripeCubit extends Cubit<PaymentStripe> {
  PaymentStripeCubit(this.checkoutRepo) : super(PaymentStripeInitial());
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
  void onChange(Change<PaymentStripe> change) {
    log(change.toString());
    super.onChange(change);
  }
}
