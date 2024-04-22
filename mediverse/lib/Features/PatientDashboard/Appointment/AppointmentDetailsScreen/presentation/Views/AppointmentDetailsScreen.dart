import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/appointment_details_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/choose_details_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Views/widgets/chooseDetails.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Views/BookingScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/PatientChatScreen/presentation/Views/PatientChatScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/presentation/Views/RatingsScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomButtonAppointmentDetails.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomDayWidget.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomDoctorDetails.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomTimeWidget.dart';


class AppointmentDetailsScreen extends StatefulWidget {
  AppointmentDetailsScreen({super.key, required this.doctorID});


  String doctorID;

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
//marco ya3ml hna
  @override
  void initState() {
    BlocProvider.of<AppointmentDetailsCubit>(context)
        .fetchDoctorInfo(widget.doctorID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentDetailsCubit, AppointmentDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is AppointmentDetailsSuccess) {
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: kprimaryColor,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: kSecondryBackgroundColor,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: const Text(
                'Details',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: kSecondryBackgroundColor,
                  fontSize: 20,
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CustomDoctorDetails(),
                  BlocProvider(
                    create: (context) => ChooseDetailsCubit(),
                    child: chooseDetails(doctor: state.doctor),
                  ),
                  
                ],
              ),
            ),
          );
        } else if (state is AppointmentDetailsLoading) {
          return const CircularProgressIndicator();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
