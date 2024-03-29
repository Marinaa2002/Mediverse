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
  });

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
                          child: Image.asset(
                            'assets/images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
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
                          Text(state.doctor.Name,
                              textAlign: TextAlign.start,
                              style: Themes.splashBoldTitle),
                          Text(state.doctor.Speciality,
                              textAlign: TextAlign.start,
                              style: Themes.labelMedium),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 8, 0),
                                child: Text(state.doctor.Rating.toString(),
                                    style: Themes.labelMedium),
                              ),
                              RatingBarIndicator(
                                rating:
                                    state.doctor.Rating, //state.doctor.Rating,
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
