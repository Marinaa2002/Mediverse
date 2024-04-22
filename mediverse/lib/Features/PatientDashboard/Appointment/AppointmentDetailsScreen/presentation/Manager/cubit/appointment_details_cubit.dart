import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/appointment_det_repo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/appointment_det_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomDayWidget.dart';
import 'package:meta/meta.dart';

part 'appointment_details_state.dart';

class AppointmentDetailsCubit extends Cubit<AppointmentDetailsState> {
  AppointmentDetailsCubit() : super(AppointmentDetailsInitial());

  final AppointmentDetailsRepo ADrepo = AppointmentDetailsRepoImpl();

  void fetchDoctorInfo(String doctorID) async {
    emit(AppointmentDetailsLoading());
    var doctor = await ADrepo.fetchDoctorInfo(doctorID);
    doctor.fold((failure) {
      emit(AppointmentDetailsFail());
    }, (doctor) {
      List<bool> clinicsListBool =
          List<bool>.filled(doctor.Clinics.length, false);

      List<Widget> clinicsList = [];

      for (int i = 0; i < clinicsListBool.length; i++) {
        String cost = doctor.Clinics[i]['cost'].toString();
        clinicsList.add(CustomDayWidget(
          day: doctor.Clinics[i]['name'],
          date: 'Cost: $cost',
          isChosen: clinicsListBool[i],
        ));
      }
      emit(AppointmentDetailsSuccess(doctor, clinicsListBool, clinicsList));
    });
  }
}
