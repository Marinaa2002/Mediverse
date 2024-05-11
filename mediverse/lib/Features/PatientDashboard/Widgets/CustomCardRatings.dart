import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/appointment_details_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Views/AppointmentDetailsScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomRatingIcon.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomCardRatings extends StatelessWidget {
  CustomCardRatings({
    super.key,
    required this.doctor,
  });

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<AppointmentDetailsCubit>(context),
              child: AppointmentDetailsScreen(
                doctorID: doctor.id,
                // profilePicture: doctor.profilePicture!,
              ),
            ),
          ),
        );
      },
      child: Row(
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
                padding: EdgeInsets.all(2),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doctor.name,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: RatingBarIndicator(
                                    rating:
                                        doctor.rating!, //state.doctor.Rating,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 25,
                                    direction: Axis.horizontal,
                                  ),
                                ),
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
                                  child: CachedNetworkImage(
                                    imageUrl: doctor.profilePicture!,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                doctor.speciality,
                                style: Themes.textSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
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
      ),
    );
  }
}
