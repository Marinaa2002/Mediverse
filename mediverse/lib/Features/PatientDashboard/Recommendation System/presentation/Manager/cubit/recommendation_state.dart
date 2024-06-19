part of 'recommendation_cubit.dart';

@immutable
sealed class RecommendationState {}

final class RecommendationInitial extends RecommendationState {}

final class RecommendationFailure extends RecommendationState {}

final class RecommendationLoading extends RecommendationState {}

final class RecommendationSuccess extends RecommendationState {
  RecommendationSuccess({required this.speciality});

  final String speciality;
}

final class RecommendationEmpty extends RecommendationState {}
