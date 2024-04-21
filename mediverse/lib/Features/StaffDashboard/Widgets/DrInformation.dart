import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoStates.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoCubit.dart';

import 'package:mediverse/Features/DoctorDashboard/widgets/AppBarRowChat.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

import 'RateWidget.dart';

class DrInformation extends StatelessWidget {
  const DrInformation({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetDoctorInfoCubit>(context)
        .getDoctorInforCubitFunction("GCdsPwoGDUp36lOBGJUJ");
    return BlocBuilder<GetDoctorInfoCubit, GetDoctorInfoState>(
      builder: (context, state) {
        if (state is GetDoctorInfoSuccess) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: kSecondryBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  alignment: const AlignmentDirectional(0, 0),
                  child: Container(
                    width: 150,
                    height: 150,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(
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
                      placeholder: (context, url) => const PlaceholderImage(
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(14, 0, 8, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr ${state.doctor.name}',
                        textAlign: TextAlign.start,
                        style: Themes.titleSmall.copyWith(
                          fontFamily: 'Readex Pro',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        state.doctor.speciality,
                        textAlign: TextAlign.start,
                        style: Themes.bodyMedium.copyWith(
                          color: Colors.black,
                          fontFamily: 'Readex Pro',
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Works at ${state.doctor.hospital}',
                        textAlign: TextAlign.start,
                        style: Themes.bodyMedium.copyWith(
                          color: Colors.black,
                          fontFamily: 'Readex Pro',
                          fontSize: 20,
                        ),
                      ),
                      RateWidget(
                        rating: state.doctor.rating!,
                        ratingCount: 12,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is GetDoctorInfoLoading) {
        } else if (state is GetDoctorInfoFailure) {}
        return Container();
      },
    );
  }
}
