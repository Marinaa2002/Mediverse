import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoStates.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoCubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientCubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientState.dart';

class AppBarRowIconChat extends StatelessWidget {
  AppBarRowIconChat({
    Key? key,
    required this.doctor_id,
    required this.patient_id,
  }) : super(key: key);
  final String doctor_id;
  final String patient_id;
  @override
  Widget build(BuildContext context) {
    if (patient_id == globalcurrentUserId) {
      BlocProvider.of<GetDoctorInfoCubit>(context)
          .getDoctorInforCubitFunction(doctor_id);
      return BlocBuilder<GetDoctorInfoCubit, GetDoctorInfoState>(
        builder: (context, state) {
          if (state is GetDoctorInfoSuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: kprimaryColor,
                    child: state.doctor.profilePicture != null
                        ? CachedNetworkImage(
                            imageUrl: state.doctor.profilePicture!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit
                                      .contain, // Center the image inside the circle
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const PlaceholderImage(
                              size: 36,
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            );
          } else if (state is GetDoctorInfoLoading) {
          } else if (state is GetDoctorInfoFailure) {
            return Center(
              child: Text(state.errMsg),
            );
          }
          return const Center();
        },
      );
    } else if (doctor_id == globalcurrentUserId) {
      BlocProvider.of<FetechPatientInfoCubit>(context)
          .getPatientInforCubitFunction(patient_id);
      return BlocBuilder<FetechPatientInfoCubit, FetechPatientInfoState>(
        builder: (context, state) {
          if (state is FetechPatientInfoStateSuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: kprimaryColor,
                    child: state.patient.profile_picture != null
                        ? CachedNetworkImage(
                            imageUrl: state.patient.profile_picture!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit
                                      .contain, // Center the image inside the circle
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const PlaceholderImage(
                              size: 36,
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            );
          } else if (state is FetechPatientInfoStateLoading) {
          } else if (state is FetechPatientInfoStateFailure) {
            log(state.errMsg);
            return Center(
              child: Text(state.errMsg),
            );
          }
          return const Center();
        },
      );
    }
    return Container();
  }
}

class PlaceholderImage extends StatelessWidget {
  final double size;

  const PlaceholderImage({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: kprimaryColor,
      child: Icon(
        Icons.person,
        size: size * 0.6,
        color: Colors.grey,
      ),
    );
  }
}
