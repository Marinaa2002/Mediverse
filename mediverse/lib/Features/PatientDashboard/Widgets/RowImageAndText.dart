import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

class RowImageAndText extends StatelessWidget {
  const RowImageAndText({
    super.key,
    required this.text,
    required this.imageUrl,
  });

  final String text;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Text(
                  text,
                  style: Themes.titleLarge.copyWith(
                    fontFamily: 'Readex Pro',
                    color: kprimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
