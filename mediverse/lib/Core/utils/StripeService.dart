import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mediverse/Core/utils/api_keys.dart';
import 'package:mediverse/Core/utils/api_service.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/InitPaymentSheetInputModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/PaymentIndentInputModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/customer_model/customer_model.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/ephermal_key_model/ephermal_key_model.dart';

import '../../Features/PatientDashboard/Appointment/BookingScreen/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({
    required InitiPaymentSheetInputModel initiPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: initiPaymentSheetInputModel.merchantDisplayName,
        paymentIntentClientSecret:
            initiPaymentSheetInputModel.paymentIntentClientSecret,
        customerEphemeralKeySecret:
            initiPaymentSheetInputModel.ephermalKeySecret,
        customerId: initiPaymentSheetInputModel.customerId,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephermalKey = await createEphermalKey(
      customerId: paymentIntentInputModel.customerId,
    );
    String customerId = await createCustomerId(name: "Philo");
    print(customerId);
    var initPaymentSheetInputModel = InitiPaymentSheetInputModel(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      merchantDisplayName: 'Philo',
      ephermalKeySecret: ephermalKey.secret!,
      customerId: paymentIntentInputModel.customerId,
    );
    await initPaymentSheet(
      initiPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }

  Future<EphermalKeyModel> createEphermalKey(
      {required String customerId}) async {
    var response = await apiService.post(
      body: {'customer': customerId},
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
        'Stripe-Version': "2023-10-16",
      },
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/ephemeral_keys",
    );
    var ephermalKey = EphermalKeyModel.fromJson(response.data);
    return ephermalKey;
  }

  Future<String> createCustomerId({required String name}) async {
    var response = await apiService.post(
      body: {'name': name},
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
      },
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/customers",
    );
    var customerModel = CustomerModel.fromJson(response.data);
    return customerModel.id!;
  }
}
