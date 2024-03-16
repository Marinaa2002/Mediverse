class InitiPaymentSheetInputModel {
  final String merchantDisplayName;
  final String paymentIntentClientSecret;
  final String ephermalKeySecret;
  final String customerId;

  InitiPaymentSheetInputModel(
      {required this.ephermalKeySecret,
      required this.customerId,
      required this.merchantDisplayName,
      required this.paymentIntentClientSecret});
}
