import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/appointment_details_cubit.dart';
import '../Widgets/CustomCardRatings.dart';
import '../Widgets/SearchBoxAppointmentWidget.dart';

class AppointmentTab extends StatelessWidget {
  AppointmentTab({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentDetailsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: const [
                    SingleChildScrollView(
                      child: SearchBoxAppointmentWidget(),
                    ),
                  ],
                ),
                CustomCardRatings(name: 'Dr Ahmed'),
                CustomCardRatings(name: 'Dr Ashraf'),
                CustomCardRatings(name: 'Dr Atef'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
