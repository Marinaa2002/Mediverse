import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Views/widgets/chooseDetails.dart';
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
        List<bool>.filled(doctor.slots![index]['Time Slots'].length, false);

    for (int i = 0; i < dayListBool.length; i++) {
      daysList.add(CustomDayWidget(
        day: doctor.slots![index]['Time Slots'][i]['Day'],
        date: doctor.slots![index]['Time Slots'][i]['Date'],
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
        day: doctor.slots![selectedClinic]['Time Slots'][i]['Day'],
        date: doctor.slots![selectedClinic]['Time Slots'][i]['Date'],
        isChosen: dayListBool[i],
      ));
    }

    List<bool> timeListBool = List<bool>.filled(
      doctor.slots![selectedClinic]['Time Slots'][index]['Time'].length,
      false,
      growable: true,
    );

    List<Widget> timeList = [];
    bool firstBooked = false;

    for (int i = 0; i < timeListBool.length; i++) {
      timeList.add(CustomTimeWidget(
        time: doctor.slots![selectedClinic]['Time Slots'][index]['Time'][i],
        isChosen: timeListBool[i],
        isBooked: (doctor.slots![selectedClinic]['Time Slots'][index]['Status']
                    [i] ==
                'booked')
            ? true
            : false,
      ));
    }

    print(timeListBool);

    emit(ChooseDetailsUpdate(clinicsList, clinicListBool, daysList, dayListBool,
        timeList, timeListBool));
  }

  void updateTimesList(
      Doctor doctor,
      List<bool> clinicListBool,
      List<Widget> clinicsList,
      List<bool> dayListBool,
      List<Widget> daysList,
      List<bool> timeListBool,
      List<Widget> timeListIn,
      int index) {
    int selectedClinicIndex = 0;

    for (int i = 0; i < clinicListBool.length; i++) {
      if (clinicListBool[i] == true) {
        selectedClinicIndex = i;
      }
    }

    String selectedClinic = doctor.slots![selectedClinicIndex]['Name'];

    int selectedDayIndex = 0;

    for (int i = 0; i < dayListBool.length; i++) {
      if (dayListBool[i] == true) {
        selectedDayIndex = i;
      }
    }

    String selectedDay = doctor.slots![selectedClinicIndex]['Time Slots']
        [selectedDayIndex]['Day'];
    String selectedDate = doctor.slots![selectedClinicIndex]['Time Slots']
        [selectedDayIndex]['Date'];

    for (int i = 0; i < timeListBool.length; i++) {
      timeListBool[i] = i == index;
    }
    print(timeListBool);

    String selectedTime =
        doctor.slots![selectedClinicIndex]['Time Slots'][index]['Time'][index];

    if (doctor.slots![selectedClinicIndex]['Time Slots'][selectedDayIndex]
            ['Status'][index] ==
        'booked') {
      emit(ChooseDetailsReady(
        clinicsList,
        clinicListBool,
        daysList,
        dayListBool,
        timeListIn,
        timeListBool,
        selectedTime,
        selectedDate,
        selectedDay,
        selectedClinic,
        true,
      ));
    } else {
      List<Widget> timeList = [];
      for (int i = 0; i < timeListBool.length; i++) {
        timeList.add(CustomTimeWidget(
          time: doctor.slots![selectedClinicIndex]['Time Slots']
              [selectedDayIndex]['Time'][i],
          isChosen: timeListBool[i],
          isBooked: (doctor.slots![selectedClinicIndex]['Time Slots']
                      [selectedDayIndex]['Status'][i] ==
                  'booked')
              ? true
              : false,
        ));
      }
      emit(ChooseDetailsReady(
          clinicsList,
          clinicListBool,
          daysList,
          dayListBool,
          timeList,
          timeListBool,
          selectedTime,
          selectedDate,
          selectedDay,
          selectedClinic,
          false));
    }
  }
}
