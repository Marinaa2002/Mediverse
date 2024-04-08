import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoStates.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoCubit.dart';

class NameIconChat extends StatelessWidget {
  NameIconChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetDoctorInfoCubit>(context)
        .getDoctorInforCubitFunction("GCdsPwoGDUp36lOBGJUJ");
    return BlocBuilder<GetDoctorInfoCubit, GetDoctorInfoState>(
      builder: (context, state) {
        if (state is GetDoctorInfoSuccess) {
          return InkWell(
            onTap: () {
              // Handle tap event
            },
            child: Container(
              margin: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.doctor.name!,
                    style: const TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    state.doctor.state!,
                    style: Themes.bodysmall.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetDoctorInfoLoading) {
        } else if (state is GetDoctorInfoFailure) {
          return Center(
            child: Text(state.errMsg),
          );
        }
        return Center();
      },
    );
  }
}
