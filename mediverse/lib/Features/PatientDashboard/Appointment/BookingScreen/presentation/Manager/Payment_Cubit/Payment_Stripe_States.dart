// ignore_for_file: file_names

sealed class PaymentStripeState {}

final class PaymentStripeStateInitial extends PaymentStripeState {}

final class PaymentStripeStateLoading extends PaymentStripeState {}

final class PaymentStripeStateSuccess extends PaymentStripeState {}

final class PaymentStripeStateFailure extends PaymentStripeState {
  final String errMessage;

  PaymentStripeStateFailure(this.errMessage);
}
