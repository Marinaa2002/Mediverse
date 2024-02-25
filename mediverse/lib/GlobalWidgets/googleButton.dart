import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/Themes.dart';
import '../Constants/constant.dart';

class googleButton extends StatelessWidget {
  const googleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: ElevatedButton(
        onPressed: () async {},
        style: ElevatedButton.styleFrom(
          backgroundColor: white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/icons/google.png",
              width: 23,
              height: 23,
            ),
            const SizedBox(width: 8),
            Text('Continue with Google', style: Themes.textSmall),
          ],
        ),
      ),
    );
  }
}
