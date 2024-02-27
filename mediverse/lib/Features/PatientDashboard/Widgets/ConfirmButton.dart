import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });
  final VoidCallback? onTap;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kprimaryColor,
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
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
