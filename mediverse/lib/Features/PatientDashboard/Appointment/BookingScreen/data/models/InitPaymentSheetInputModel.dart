class InitiPaymentSheetInputModel {
  final String merchantDisplayName;
  final String paymentIntentClientSecret;

  InitiPaymentSheetInputModel(
      {required this.merchantDisplayName,
      required this.paymentIntentClientSecret});
}
