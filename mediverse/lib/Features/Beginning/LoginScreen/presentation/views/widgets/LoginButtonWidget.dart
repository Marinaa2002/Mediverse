import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';

import '../../../../../../Constants/constant.dart';
import '../../Manager/login_cubit/login_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  final text;
  final screen;
  const LoginButtonWidget({
    super.key,
    required this.text,
    required this.screen,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.width * 0.04),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primaryColor,
            elevation: 3,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: SizedBox(
            width: size.width * 0.6,
            height: 52,
            child: Center(
              child: Text(
                text,
                style: Themes.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
