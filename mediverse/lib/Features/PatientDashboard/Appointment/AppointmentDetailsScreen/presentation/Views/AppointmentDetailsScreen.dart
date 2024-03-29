import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/appointment_details_cubit.dart';
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
          List<bool> clinicsListBool =
              List<bool>.filled(state.doctor.Clinics.length, false);
          List<Widget> clinicsList = [];

          List<Widget> clinicListBuilder() {
            for (int i = 0; i < clinicsListBool.length; i++) {
              String cost = state.doctor.Clinics[i]['cost'].toString();
              clinicsList.add(CustomDayWidget(
                day: state.doctor.Clinics[i]['name'],
                date: 'Cost: $cost',
                isChosen: clinicsListBool[i],
              ));
            }
            return clinicsList;
          }

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
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
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
                      isSelected: clinicsListBool,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < clinicsListBool.length; i++) {
                            clinicsListBool[i] = i == index;
                          }
                          print(clinicsListBool);
                        });
                      },
                      children: clinicListBuilder(),
                      // CustomDayWidget(
                      //   day: 'Tuesday',
                      //   date: '7 October',
                      //   // colorBox: Colors.white,
                      //   // colorText: Colors.black,
                      // ),
                      // CustomDayWidget(
                      //   day: 'Tuesday',
                      //   date: '7 October',
                      //   // colorBox: Colors.white,
                      //   // colorText: Colors.black,
                      // ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                      child: Text('Day:', style: Themes.bodyMedium),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomDayWidget(
                            day: 'Saturday',
                            date: '4 October',
                            // colorBox: Colors.indigo,
                            // colorText: Colors.white,
                          ),
                          CustomDayWidget(
                            day: 'Monday',
                            date: '6 October',
                            // colorBox: Colors.white,
                            // colorText: Colors.black,
                          ),
                          CustomDayWidget(
                            day: 'Tuesday',
                            date: '7 October',
                            // colorBox: Colors.white,
                            // colorText: Colors.black,
                          ),
                          CustomDayWidget(
                            day: 'Thursday',
                            date: '9 October',
                            // colorBox: Colors.white,
                            // colorText: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                      child: Text('Time:', style: Themes.bodyMedium),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomTimeWidget(
                              time: '7:00 Pm',
                              colorBox: Colors.indigo,
                              colorText: Colors.white),
                          CustomTimeWidget(
                              time: '7:30 Pm',
                              colorBox: Colors.white,
                              colorText: Colors.black),
                          CustomTimeWidget(
                              time: '8:00 Pm',
                              colorBox: Colors.white,
                              colorText: Colors.black),
                          CustomTimeWidget(
                              time: '8:30 Pm',
                              colorBox: Colors.white,
                              colorText: Colors.black),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButtonAppointmentDetails(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PatientChatScreen(),
                                ));
                          },
                          buttonName: 'Chat',
                          icon: Icons.chat,
                        ),
                        CustomButtonAppointmentDetails(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookingScreen(),
                              ),
                            );
                          },
                          buttonName: 'Book',
                          icon: Icons.book,
                        ),
                        CustomButtonAppointmentDetails(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RatingsScreen(),
                                ));
                          },
                          buttonName: 'Rate',
                          icon: Icons.star_rate_sharp,
                        ),
                      ],
                    ),
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
