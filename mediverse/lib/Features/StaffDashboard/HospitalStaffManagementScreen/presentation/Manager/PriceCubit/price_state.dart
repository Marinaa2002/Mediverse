part of 'price_cubit.dart';

@immutable
sealed class PriceCubitState {}

final class PriceCubitInitial extends PriceCubitState {}

final class PriceCubitLoading extends PriceCubitState {}

final class PriceCubitEmpty extends PriceCubitState {}

final class PriceCubitSuccess extends PriceCubitState {
  final PriceModel priceModel;

  PriceCubitSuccess({required this.priceModel});
}

final class PriceCubitFailure extends PriceCubitState {
  final String errMessage;

  PriceCubitFailure(this.errMessage);
}
