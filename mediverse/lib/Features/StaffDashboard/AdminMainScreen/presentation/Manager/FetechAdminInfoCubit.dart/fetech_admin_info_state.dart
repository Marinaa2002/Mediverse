part of 'fetech_admin_info_cubit.dart';

@immutable
sealed class FetechAdminInfoState {}

final class FetechAdminInfoInitial extends FetechAdminInfoState {}

final class FetechAdminInfoLoading extends FetechAdminInfoState {}

final class FetechAdminInfoSuccess extends FetechAdminInfoState {
  final Admin admin;

  FetechAdminInfoSuccess({required this.admin});
}

final class FetechAdminInfoFailure extends FetechAdminInfoState {
  final String errMsg;

  FetechAdminInfoFailure({required this.errMsg});
}
