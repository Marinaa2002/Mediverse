import 'package:flutter/material.dart';

import '../Appointment/AppointmentDetailsScreen/presentation/Views/AppointmentDetailsScreen.dart';
import '../Widgets/CustomCardRatings.dart';
import '../Widgets/SearchBoxAppointmentWidget.dart';

class AppointmentTab extends StatelessWidget {
  AppointmentTab({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentDetailsScreen(),
                        ));
                  },
                  child: CustomCardRatings(name: 'Dr Ahmed')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentDetailsScreen(),
                        ));
                  },
                  child: CustomCardRatings(name: 'Dr Hoda')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentDetailsScreen(),
                        ));
                  },
                  child: CustomCardRatings(name: 'Dr Ashraf')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentDetailsScreen(),
                        ));
                  },
                  child: CustomCardRatings(name: 'Dr Mohamed')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentDetailsScreen(),
                        ));
                  },
                  child: CustomCardRatings(name: 'Dr Ashraf')),
            ],
          ),
        ),
      ),
    );
  }
}
