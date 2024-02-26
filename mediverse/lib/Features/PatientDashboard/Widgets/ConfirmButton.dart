import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kprimaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Confirm Booking',
              style: Themes.titleLarge.copyWith(
                color: Colors.white,
                fontFamily: 'Readex Pro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
