import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/appointment_details_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Views/AppointmentDetailsScreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../Constants/Themes.dart';
import 'CustomRatingIcon.dart';

class CustomDoctorDetails extends StatelessWidget {
  const CustomDoctorDetails({
    super.key,
    // required this.profilePicture,
  });
  // final String profilePicture;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentDetailsCubit, AppointmentDetailsState>(
      builder: (context, state) {
        if (state is AppointmentDetailsSuccess) {
          return Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://firebasestorage.googleapis.com/v0/b/mediverse-app.appspot.com/o/photos%2Fimages.jpeg.jpg?alt=media&token=817e3dcf-a8dd-484b-913a-8fcf65b70638",
                            width: 250,
                            height: 150,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(14, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.doctor.name,
                              textAlign: TextAlign.start,
                              style: Themes.splashBoldTitle),
                          Text(state.doctor.speciality,
                              textAlign: TextAlign.start,
                              style: Themes.labelMedium),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 8, 0),
                                child: Text(state.doctor.rating.toString(),
                                    style: Themes.labelMedium),
                              ),
                              RatingBarIndicator(
                                rating:
                                    state.doctor.rating!, //state.doctor.Rating,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 25,
                                direction: Axis.horizontal,
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
          );
        } else if (state is AppointmentDetailsLoading) {
          return const CircularProgressIndicator();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
