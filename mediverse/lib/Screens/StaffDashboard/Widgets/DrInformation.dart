import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';
import 'RateWidget.dart';

class DrInformation extends StatelessWidget {
  const DrInformation({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Image.asset(
                'assets/images/Human.jpg',
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
                  'Dr. Janny Wilson',
                  textAlign: TextAlign.start,
                  style: Themes.titleSmall.copyWith(
                    fontFamily: 'Readex Pro',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Cardiologist',
                  textAlign: TextAlign.start,
                  style: Themes.bodyMedium.copyWith(
                    color: Colors.black,
                    fontFamily: 'Readex Pro',
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Works at Alhayah Hospital',
                  textAlign: TextAlign.start,
                  style: Themes.bodyMedium.copyWith(
                    color: Colors.black,
                    fontFamily: 'Readex Pro',
                    fontSize: 16,
                  ),
                ),
                const RateWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
