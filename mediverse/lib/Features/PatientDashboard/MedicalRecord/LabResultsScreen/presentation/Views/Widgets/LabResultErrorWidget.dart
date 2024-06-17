import 'package:flutter/material.dart';

import '../../../../../../../Constants/Themes.dart';

class LabResultErrorWidget extends StatelessWidget {
  LabResultErrorWidget({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return
      //Center(child: Text(errMessage, style: Themes.labelLarge18,));
      Center(
        child: Text(
          errMessage,
          style: Themes.bodyLarge.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.grey),
        ),
      );
  }
}