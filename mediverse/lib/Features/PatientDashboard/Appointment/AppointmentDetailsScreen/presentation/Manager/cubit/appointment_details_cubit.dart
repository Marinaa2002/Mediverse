import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:meta/meta.dart';

part 'appointment_details_state.dart';

class AppointmentDetailsCubit extends Cubit<AppointmentDetailsState> {
  AppointmentDetailsCubit() : super(AppointmentDetailsInitial());
}
