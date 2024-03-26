import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoCubit.dart';

class AppBarRowIconChat extends StatelessWidget {
  AppBarRowIconChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetDoctorInfoCubit>(context)
        .getDoctorInforCubitFunction("GCdsPwoGDUp36lOBGJUJ");
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
                          placeholder: (context, url) => const PlaceholderImage(
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
