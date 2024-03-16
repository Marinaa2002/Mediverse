import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Views/BookingScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/PatientChatScreen/presentation/Views/PatientChatScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/presentation/Views/RatingsScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomButtonAppointmentDetails.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomDayWidget.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomDoctorDetails.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomTimeWidget.dart';


class AppointmentDetailsScreen extends StatelessWidget {
  AppointmentDetailsScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
        actions: [],
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
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
                child: Text('Cost For Booking: 150.00 L.E',
                    style: Themes.labelLarge18),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text('Day', style: Themes.bodyMedium),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomDayWidget(
                        day: 'Saturday',
                        date: '4 October',
                        colorBox: Colors.indigo,
                        colorText: Colors.white),
                    CustomDayWidget(
                        day: 'Monday',
                        date: '6 October',
                        colorBox: Colors.white,
                        colorText: Colors.black),
                    CustomDayWidget(
                        day: 'Tuesday',
                        date: '7 October',
                        colorBox: Colors.white,
                        colorText: Colors.black),
                    CustomDayWidget(
                        day: 'Thursday',
                        date: '9 October',
                        colorBox: Colors.white,
                        colorText: Colors.black),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text('Time', style: Themes.bodyMedium),
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
                          ));
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
  }
}
