import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/choose_details_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomTimeWidget.dart';

class chooseDetails extends StatefulWidget {
  chooseDetails({super.key, required this.doctor});

  Doctor doctor;

  @override
  State<chooseDetails> createState() => _chooseDetailsState();
}

class _chooseDetailsState extends State<chooseDetails> {
  @override
  void initState() {
    BlocProvider.of<ChooseDetailsCubit>(context)
        .initializeClinicsList(widget.doctor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseDetailsCubit, ChooseDetailsState>(
      builder: (context, state) {
        if (state is ChooseDetailsUpdate) {
          return Column(
            children: [
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                  child: Text('Clinic:', style: Themes.bodyMedium),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  renderBorder: false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  fillColor: backgroundColor,
                  isSelected: state.clinicListBool,
                  onPressed: (int index) {
                    final chooseCubit = context.read<ChooseDetailsCubit>();
                    chooseCubit.updateClinicList(
                        widget.doctor, state.clinicListBool, index);
                  },
                  children: state.clinicsList,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                  child: Text('Day:', style: Themes.bodyMedium),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  renderBorder: false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  fillColor: backgroundColor,
                  isSelected: state.dayListBool,
                  onPressed: (int index) {
                    final chooseCubit = context.read<ChooseDetailsCubit>();
                    chooseCubit.updateDaysList(
                      widget.doctor,
                      state.clinicListBool,
                      state.clinicsList,
                      state.dayListBool,
                      index,
                    );
                  },
                  children: state.daysList,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                  child: Text('Time:', style: Themes.bodyMedium),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  renderBorder: false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  fillColor: backgroundColor,
                  isSelected: state.timeListBool,
                  onPressed: (int index) {
                    final chooseCubit = context.read<ChooseDetailsCubit>();
                    chooseCubit.updateTimesList(
                      widget.doctor,
                      state.clinicListBool,
                      state.clinicsList,
                      state.dayListBool,
                      state.daysList,
                      state.timeListBool,
                      index,
                    );
                  },
                  children: state.timesList,
                ),
              ),
            ],
          );
        }else if(state is ChooseDetailsReady){
          return Column(
            children: [
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                  child: Text('Clinic:', style: Themes.bodyMedium),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  renderBorder: false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  fillColor: backgroundColor,
                  isSelected: state.clinicListBool,
                  onPressed: (int index) {
                    final chooseCubit = context.read<ChooseDetailsCubit>();
                    chooseCubit.updateClinicList(
                        widget.doctor, state.clinicListBool, index);
                  },
                  children: state.clinicsList,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                  child: Text('Day:', style: Themes.bodyMedium),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  renderBorder: false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  fillColor: backgroundColor,
                  isSelected: state.dayListBool,
                  onPressed: (int index) {
                    final chooseCubit = context.read<ChooseDetailsCubit>();
                    chooseCubit.updateDaysList(
                      widget.doctor,
                      state.clinicListBool,
                      state.clinicsList,
                      state.dayListBool,
                      index,
                    );
                  },
                  children: state.daysList,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                  child: Text('Time:', style: Themes.bodyMedium),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  renderBorder: false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  fillColor: backgroundColor,
                  isSelected: state.timeListBool,
                  onPressed: (int index) {
                    final chooseCubit = context.read<ChooseDetailsCubit>();
                    chooseCubit.updateTimesList(
                      widget.doctor,
                      state.clinicListBool,
                      state.clinicsList,
                      state.dayListBool,
                      state.daysList,
                      state.timeListBool,
                      index,
                    );
                  },
                  children: state.timesList,
                ),
              ),
            ],
          );
        } else if (state is ChooseDetailsLoading) {
          return const CircularProgressIndicator();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
