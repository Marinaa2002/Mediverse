import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Screens/PatientDashboard/Appointment/AppointmentDetailsScreen.dart';

import '../Widgets/CustomCardRatings.dart';


class AppointmentTab extends StatelessWidget {
  AppointmentTab({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional
                                  .fromSTEB(10, 15, 0, 0),
                              child: Container(
                                width: 320,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color:
                                      Color(0x33000000),
                                      offset: Offset(0, 2),
                                      spreadRadius: 3,
                                    )
                                  ],
                                  borderRadius:
                                  BorderRadius.circular(
                                      20),
                                  border: Border.all(
                                    color: kprimaryColor,
                                  ),
                                ),
                                alignment:
                                AlignmentDirectional(
                                    0, 0),
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional
                                      .fromSTEB(
                                      8, 0, 8, 0),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration:
                                    InputDecoration(
                                      hintText: 'Search ',
                                      enabledBorder:
                                      UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(
                                          color: kprimaryColor,
                                          width: 2,
                                        ),
                                        borderRadius:
                                        BorderRadius
                                            .circular(8),
                                      ),
                                      focusedBorder:
                                      UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(
                                          color: kprimaryColor,
                                          width: 2,
                                        ),
                                        borderRadius:
                                        BorderRadius
                                            .circular(8),
                                      ),
                                      errorBorder:
                                      UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius:
                                        BorderRadius
                                            .circular(8),
                                      ),
                                      focusedErrorBorder:
                                      UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius:
                                        BorderRadius
                                            .circular(8),
                                      ),
                                      contentPadding:
                                      EdgeInsetsDirectional
                                          .fromSTEB(
                                          8, 0, 8, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional
                                  .fromSTEB(0, 15, 0, 0),
                              child: Card(
                                clipBehavior: Clip
                                    .antiAliasWithSaveLayer,
                                color: Color(0xFFF1F4F8),
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      40),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF57636C),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentDetailsScreen(),));
                },
                  child: CustomCardRatings(name: 'Dr Ahmed')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentDetailsScreen(),));
                  },
                  child: CustomCardRatings(name: 'Dr Hoda')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentDetailsScreen(),));
                  },
                  child: CustomCardRatings(name: 'Dr Ashraf')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentDetailsScreen(),));
                  },
                  child: CustomCardRatings(name: 'Dr Mohamed')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentDetailsScreen(),));
                  },
                  child: CustomCardRatings(name: 'Dr Ashraf')),
            ],
          ),
        ),
      ),
    );
  }

}