part of 'GetDoctorInfoCubit.dart';

@immutable
sealed class GetDoctorInfoState {}

final class GetDoctorInfoInitial extends GetDoctorInfoState {}

final class GetDoctorInfoSuccess extends GetDoctorInfoState {
  final Doctor doctor;

  GetDoctorInfoSuccess({required this.doctor});
}

final class GetDoctorInfoFailure extends GetDoctorInfoState {
  final String errMsg;

  GetDoctorInfoFailure({required this.errMsg});
}

final class GetDoctorInfoLoading extends GetDoctorInfoState {}
