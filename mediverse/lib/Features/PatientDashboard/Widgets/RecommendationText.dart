import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

class RecommendationText extends StatelessWidget {
  RecommendationText({required this.speciality});

  final String speciality;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber,
          color: primaryColor,
          size: 40,
        ),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text:
                'According to your medical history and records,\n we recommend you go to a ',
            style: Themes.bodyLarge,
            children: <TextSpan>[
              TextSpan(
                text: speciality,
                style: Themes.bodyXLarge.copyWith(
                  color: primaryColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
