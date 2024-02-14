import 'package:flutter/material.dart';

import '../../../Widgets/CustomCardRatings.dart';

class RatingsScreen extends StatelessWidget {
  RatingsScreen({super.key});

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
          'Review Page',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x39000000),
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Text(
                                  '2,503',
                                  style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                '# of Ratings',
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 12),
                                    child: Text(
                                      '4.6',
                                      style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 12),
                                    child: Icon(
                                      Icons.star_rounded,
                                      color: Colors.yellow,
                                      size: 28,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Avg. Rating',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.indigo,
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, -1),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Add Your Review :',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
                        child: Text(
                          'Tell others what you think',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_rate_sharp,
                          color: Colors.grey,
                          size: 24,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          color: Colors.grey,
                          size: 24,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          color: Colors.grey,
                          size: 24,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          color: Colors.grey,
                          size: 24,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          color: Colors.grey,
                          size: 24,
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                                spreadRadius: 3,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.indigo,
                            ),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(5, 8, 5, 8),
                              child: TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Write Your Review Here',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                ),
                                maxLines: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomCardRatings(name: 'Vacation Home'),
              CustomCardRatings(name: 'Vacation Home'),
              CustomCardRatings(name: 'Vacation Home'),
              CustomCardRatings(name: 'Vacation Home'),


            ],
          ),
        ),
      ),
    );
  }
}
