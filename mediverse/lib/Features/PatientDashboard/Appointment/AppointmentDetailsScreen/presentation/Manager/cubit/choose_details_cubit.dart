import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomDayWidget.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomTimeWidget.dart';
import 'package:meta/meta.dart';

part 'choose_details_state.dart';

class ChooseDetailsCubit extends Cubit<ChooseDetailsState> {
  ChooseDetailsCubit() : super(ChooseDetailsInitial());

  void initializeClinicsList(Doctor doctor) {
    List<bool> clinicListBool = List<bool>.filled(doctor.Clinics.length, false);
    List<Widget> clinicsList = [];

    for (int i = 0; i < clinicListBool.length; i++) {
      String cost = doctor.Clinics[i]['cost'].toString();
      clinicsList.add(CustomDayWidget(
        day: doctor.Clinics[i]['name'],
        date: 'Cost: $cost EGP',
        isChosen: clinicListBool[i],
      ));
    }
    List<Widget> daysList = [const Text('Please Choose Clinic')];
    List<bool> dayListBool = [false];
    List<Widget> timesList = [const Text('Please Choose Clinic')];
    List<bool> timeListBool = [false];
    emit(ChooseDetailsUpdate(clinicsList, clinicListBool, daysList, dayListBool,
        timesList, timeListBool));
  }

  void updateClinicList(Doctor doctor, List<bool> clinicListBool, int index) {
    List<Widget> clinicsList = [];
    List<Widget> daysList = [];

    for (int i = 0; i < clinicListBool.length; i++) {
      clinicListBool[i] = i == index;
    }
    print(clinicListBool);

    for (int i = 0; i < clinicListBool.length; i++) {
      String cost = doctor.Clinics[i]['cost'].toString();
      clinicsList.add(CustomDayWidget(
        day: doctor.Clinics[i]['name'],
        date: 'Cost: $cost EGP',
        isChosen: clinicListBool[i],
      ));
    }

    List<bool> dayListBool =
        List<bool>.filled(doctor.Slots[index]['Time Slots'].length, false);

    for (int i = 0; i < dayListBool.length; i++) {
      daysList.add(CustomDayWidget(
        day: doctor.Slots[index]['Time Slots'][i]['Day'],
        date: doctor.Slots[index]['Time Slots'][i]['Date'],
        isChosen: dayListBool[i],
      ));
    }

    List<Widget> timesList = [const Text('Please Choose Clinic')];
    List<bool> timeListBool = [false];
    emit(ChooseDetailsUpdate(clinicsList, clinicListBool, daysList, dayListBool,
        timesList, timeListBool));
  }

  void updateDaysList(Doctor doctor, List<bool> clinicListBool,
      List<Widget> clinicsList, List<bool> dayListBool, int index) {
    List<Widget> daysList = [];

    int selectedClinic = 0;

    for (int i = 0; i < clinicListBool.length; i++) {
      if (clinicListBool[i] == true) {
        selectedClinic = i;
      }
    }

    for (int i = 0; i < dayListBool.length; i++) {
      dayListBool[i] = i == index;
    }
    print(dayListBool);

    for (int i = 0; i < dayListBool.length; i++) {
      daysList.add(CustomDayWidget(
        day: doctor.Slots[selectedClinic]['Time Slots'][i]['Day'],
        date: doctor.Slots[selectedClinic]['Time Slots'][i]['Date'],
        isChosen: dayListBool[i],
      ));
    }

    List<bool> timeListBool = List<bool>.filled(
      doctor.Slots[selectedClinic]['Time Slots'][index]['Time'].length,
      false,
      growable: true,
    );

    List<Widget> timeList = [];
    bool firstBooked = false;

    for (int i = 0; i < timeListBool.length; i++) {
      if (doctor.Slots[selectedClinic]['Time Slots'][index]['Status'][i] ==
          'booked') {
        if (i != 0) {
          timeListBool.removeAt(i);
          continue;
        }
        firstBooked = true;
        continue;
      }
      timeList.add(CustomTimeWidget(
        time: doctor.Slots[selectedClinic]['Time Slots'][index]['Time'][i],
        isChosen: timeListBool[i],
      ));
    }
    if (timeList.isEmpty) {
      timeList = [const Text('All Day Slots Are Booked!!')];
      timeListBool = [false];
    } else if (firstBooked) {
      timeListBool.removeAt(0);
    }
    print(timeListBool);

    emit(ChooseDetailsUpdate(clinicsList, clinicListBool, daysList, dayListBool,
        timeList, timeListBool));
  }
}
