// ignore_for_file: file_names

sealed class PaymentStripe {}

final class PaymentStripeInitial extends PaymentStripe {}

final class PaymentStripeLoading extends PaymentStripe {}

final class PaymentStripeSuccess extends PaymentStripe {}

final class PaymentStripeFailure extends PaymentStripe {
  final String errMessage;

  PaymentStripeFailure(this.errMessage);
}
