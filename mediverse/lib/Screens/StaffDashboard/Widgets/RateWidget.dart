import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
          child: Text(
            '4.1',
            style: Themes.bodyMedium.copyWith(
              fontFamily: 'Readex Pro',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const Icon(
          Icons.star_rate,
          color: Colors.yellow,
          size: 24,
        ),
        const Icon(
          Icons.star_rate_sharp,
          color: Colors.yellow,
          size: 24,
        ),
        const Icon(
          Icons.star_rate_sharp,
          color: Colors.yellow,
          size: 24,
        ),
        const Icon(
          Icons.star_rate_sharp,
          color: Colors.yellow,
          size: 24,
        ),
        const Icon(
          Icons.star_rate_sharp,
          color: Colors.black,
          size: 24,
        ),
      ],
    );
  }
}
