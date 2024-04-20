import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomRatingIcon.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/RowOfAppointmentTab.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/RateWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/RowRequestWidget.dart';

class CustomCardRatings extends StatelessWidget {
  CustomCardRatings({
    super.key,
    required this.doctor,
  });

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
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
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Dr ${doctor.name}',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 4),
                                child: RateWidget(
                                  rating:
                                      doctor.rating == 0 ? 4.2 : doctor.rating,
                                  ratingCount: 12,
                                  size: 10,
                                ),
                              ),
                              RowOfAppointmentTab(
                                fieldValue: doctor.hospital,
                                field: 'Organization Name',
                              ),
                              RowOfAppointmentTab(
                                  fieldValue: doctor.location ?? 'ABC',
                                  field: 'Address')
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: const AlignmentDirectional(0, 0),
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80.0),
                                child: Image.network(
                                  doctor.profilePicture ??
                                      'https://firebasestorage.googleapis.com/v0/b/mediverse-app.appspot.com/o/photos%2FCAP1530581265562441583.jpg?alt=media&token=6bcadeaf-c644-41dd-a183-999ed71e7434',
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0, 0),
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
            ),
          ),
        ),
      ],
    );
  }
}
