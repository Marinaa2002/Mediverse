import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mediverse/Core/utils/api_keys.dart';
import 'package:mediverse/Core/utils/api_service.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/InitPaymentSheetInputModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/PaymentIndentInputModel.dart';

import '../../Features/PatientDashboard/Appointment/BookingScreen/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({
    required InitiPaymentSheetInputModel initiPaymentSheetInputModel,
  }) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: initiPaymentSheetInputModel.merchantDisplayName,
        paymentIntentClientSecret:
            initiPaymentSheetInputModel.paymentIntentClientSecret,
      ),
    );
  }

  Future displayPaymentSheet() async {
    Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var initPaymentSheetInputModel = InitiPaymentSheetInputModel(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        merchantDisplayName: 'Philo');
    await initPaymentSheet(
        initiPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }
}
