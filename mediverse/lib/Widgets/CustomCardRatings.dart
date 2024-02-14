import 'package:flutter/material.dart';

class CustomCardRatings extends StatelessWidget {
  CustomCardRatings({super.key, required this.name});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.96,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16, 12, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '$name',
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,)
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
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
                                      color: Colors.yellow,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16, 4, 16, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  }