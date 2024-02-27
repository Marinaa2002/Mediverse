// ignore_for_file: file_names

sealed class PaymentStripeState {}

final class PaymentStripeInitial extends PaymentStripeState {}

final class PaymentStripeLoading extends PaymentStripeState {}

final class PaymentStripeSuccess extends PaymentStripeState {}

final class PaymentStripeFailure extends PaymentStripeState {
  final String errMessage;

  PaymentStripeFailure(this.errMessage);
}
