import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomRatingIcon.dart';

class CustomCardRatings extends StatelessWidget {
  CustomCardRatings({super.key, required this.name});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final String name;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.96,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                     Padding(
                      padding:
                           EdgeInsetsDirectional.fromSTEB(size.width*.04, 12, size.width*.04, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$name',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Padding(
                                padding:  EdgeInsetsDirectional.fromSTEB(
                                    0, size.height*.001, 0, size.height*.001),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                 // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CustomRatingIconWidget(
                                        color: Colors.yellow),
                                    CustomRatingIconWidget(
                                        color: Colors.yellow),
                                    CustomRatingIconWidget(
                                        color: Colors.yellow),
                                    CustomRatingIconWidget(
                                        color: Colors.yellow),
                                    CustomRatingIconWidget(
                                        color: Colors.yellow),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: size.width*0.15,
                            height: size.width*0.15,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: const AlignmentDirectional(0, 0),
                            child: SizedBox(
                              width: size.width*0.3,
                              height: size.width*0.3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80.0),
                                child: Image.asset(
                                  'assets/images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
                                  width: size.width*0.3,
                                  height: size.width*0.3,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                     Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(size.width*.04, 4, size.width*.04, 12),
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
