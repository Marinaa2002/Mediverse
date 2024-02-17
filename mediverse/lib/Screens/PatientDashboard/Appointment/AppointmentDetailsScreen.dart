import 'package:flutter/material.dart';
import 'package:mediverse/Screens/PatientDashboard/Appointment/PatientChatScreen.dart';
import 'package:mediverse/Screens/PatientDashboard/Appointment/RatingsScreen.dart';
import 'package:mediverse/Widgets/CustomDayWidget.dart';
import 'package:mediverse/Widgets/CustomTimeWidget.dart';

import 'BookingScreen.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  AppointmentDetailsScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 24,
        ),
        title: Text(
          'Details',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
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
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Dentist',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Works at Tiba Dental Care',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: Text(
                                    '4.1',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.star_rate_sharp,
                                  color: Colors.yellow,
                                  size: 24,
                                ),
                                Icon(
                                  Icons.star_rate_sharp,
                                  color: Colors.yellow,
                                  size: 24,
                                ),
                                Icon(
                                  Icons.star_rate_sharp,
                                  color: Colors.yellow,
                                  size: 24,
                                ),
                                Icon(
                                  Icons.star_rate_sharp,
                                  color: Colors.yellow,
                                  size: 24,
                                ),
                                Icon(
                                  Icons.star_rate_sharp,
                                  color: Colors.grey,
                                  size: 24,
                                ),
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
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text(
                  'Day',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 10, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PatientChatScreen(),));
                      },
                      child: Container(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.indigo,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.chat, size: 15,color: Colors.white,),
                            SizedBox(width: 10,),
                            Text('Chat', style: TextStyle(color: Colors.white, fontFamily: 'Readex Pro',),),

                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen(),));
                      },
                      child: Container(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.indigo,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.book, size: 15,color: Colors.white,),
                            SizedBox(width: 10,),
                            Text('Book', style: TextStyle(color: Colors.white, fontFamily: 'Readex Pro',),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RatingsScreen(),));
                      },
                      child: Container(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.indigo,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star_rate_sharp, size: 15,color: Colors.white,),
                            SizedBox(width: 10,),
                            Text('Rate', style: TextStyle(color: Colors.white, fontFamily: 'Readex Pro',),),

                          ],
                        ),
                      ),
                    ),
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
