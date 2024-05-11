import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/appointment_details_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/choose_details_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Views/widgets/chooseDetails.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomDoctorDetails.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  AppointmentDetailsScreen({
    super.key,
    required this.doctorID,
  });

  String doctorID;
  // String profilePicture;

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
            body: SingleChildScrollView(
              child: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomDoctorDetails(
                        // profilePicture: widget.profilePicture,
                        ),
                    BlocProvider(
                      create: (context) => ChooseDetailsCubit(),
                      child: chooseDetails(doctor: state.doctor),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is AppointmentDetailsLoading) {
          return const Loading();
        } else if (state is AppointmentDetailsFail) {
          return Center(
            child: Text("Error"),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
