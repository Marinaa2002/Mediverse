part of 'appointment_details_cubit.dart';

@immutable
sealed class AppointmentDetailsState {
  const AppointmentDetailsState();
}

final class AppointmentDetailsInitial extends AppointmentDetailsState {}

final class AppointmentDetailsLoading extends AppointmentDetailsState {}

final class AppointmentDetailsSuccess extends AppointmentDetailsState {
  final Doctor doctor;

  const AppointmentDetailsSuccess(this.doctor);
}

final class AppointmentDetailsFail extends AppointmentDetailsState {}
