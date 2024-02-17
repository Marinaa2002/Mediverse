import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Screens/PatientDashboard/Appointment/PatientChatScreen.dart';
import 'package:mediverse/Screens/PatientDashboard/Appointment/RatingsScreen.dart';
import 'package:mediverse/Screens/PatientDashboard/Widgets/CustomButtonAppointmentDetails.dart';
import 'package:mediverse/Screens/PatientDashboard/Widgets/CustomRatingIcon.dart';

import '../Widgets/CustomDayWidget.dart';
import '../Widgets/CustomTimeWidget.dart';
import 'BookingScreen.dart';

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
        leading: Icon(
          Icons.chevron_left,
          color: kSecondryBackgroundColor,
          size: 24,
        ),
        title: Text(
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
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: 150,
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80.0),
                            child: Image.asset(
                              'assets/images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
                              width: 300,
                              height: 200,
                              fit: BoxFit.fill,
                              alignment: Alignment(0, 0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(14, 0, 8, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Janny Wilson',
                              textAlign: TextAlign.start,
                              style: Themes.bodyMedium
                            ),
                            Text(
                              'Dentist',
                              textAlign: TextAlign.start,
                              style: Themes.labelMedium
                            ),
                            Text(
                              'Works at Tiba Dental Care',
                              textAlign: TextAlign.start,
                              style: Themes.labelMedium
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: Text(
                                    '4.1',
                                    style: Themes.labelMedium
                                  ),
                                ),
                                CustomRatingIconWidget(color: Colors.yellow),
                                CustomRatingIconWidget(color: Colors.yellow),
                                CustomRatingIconWidget(color: Colors.yellow),
                                CustomRatingIconWidget(color: Colors.yellow),
                                CustomRatingIconWidget(color: Colors.grey),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
                child: Text(
                  'Cost For Booking: 150.00 L.E',
                  style: Themes.labelLarge18
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text(
                  'Day',
                  style: Themes.bodyMedium
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomDayWidget(day: 'Saturday', date: '4 October', colorBox: Colors.indigo, colorText: Colors.white),
                    CustomDayWidget(day: 'Monday', date: '6 October', colorBox: Colors.white, colorText: Colors.black),
                    CustomDayWidget(day: 'Tuesday', date: '7 October', colorBox: Colors.white, colorText: Colors.black),
                    CustomDayWidget(day: 'Thursday', date: '9 October', colorBox: Colors.white, colorText: Colors.black),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text(
                  'Time',
                  style: Themes.bodyMedium
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomTimeWidget(time: '7:00 Pm', colorBox: Colors.indigo, colorText: Colors.white),
                    CustomTimeWidget(time: '7:30 Pm', colorBox: Colors.white, colorText: Colors.black),
                    CustomTimeWidget(time: '8:00 Pm', colorBox: Colors.white, colorText: Colors.black),
                    CustomTimeWidget(time: '8:30 Pm', colorBox: Colors.white, colorText: Colors.black),
              ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonAppointmentDetails(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PatientChatScreen(),));
                  }, buttonName: 'Chat', icon: Icons.chat,),
                  CustomButtonAppointmentDetails(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen(),));
                  }, buttonName: 'Book', icon: Icons.book,),
                  CustomButtonAppointmentDetails(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RatingsScreen(),));
                  }, buttonName: 'Rate', icon: Icons.star_rate_sharp,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
