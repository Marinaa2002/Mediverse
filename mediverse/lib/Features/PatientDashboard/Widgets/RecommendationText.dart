import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/PatientDashboard/Recommendation%20System/presentation/Manager/cubit/recommendation_cubit.dart';

class RecommendationText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        if (state is RecommendationSuccess) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.warning_amber,
                  color: primaryColor,
                  size: 40,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 8, 0),
                  child: Column(
                    children: [
                      Text(
                        'According to your medical history and records, we recommend you go to a ',
                        textAlign: TextAlign.center,
                        style: Themes.bodyLarge,
                      ),
                      Text(
                        state.speciality,
                        textAlign: TextAlign.center,
                        style: Themes.bodyXLarge.copyWith(
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              )
              // Text.rich(
              //   textAlign: TextAlign.center,
              //   TextSpan(
              //     text:
              //         'According to your medical history and records,\n we recommend you go to a ',
              //     style: Themes.bodyLarge,
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: state.speciality,
              //         style: Themes.bodyXLarge.copyWith(
              //           color: primaryColor,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          );
        } else if (state is RecommendationEmpty) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(6, 6, 6, 10),
            child: Text(
              'Data is insufficient to make a doctor recommendation',
              style: Themes.bodyLarge,
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is RecommendationLoading) {
          return Loading();
        } else {
          return Text('Error');
        }
      },
    );
  }
}
