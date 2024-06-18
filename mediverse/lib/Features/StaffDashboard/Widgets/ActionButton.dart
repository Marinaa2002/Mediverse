import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

import '../../../Constants/Themes.dart';
import '../HospitalStaffManagementScreen/presentation/Views/HospitalStaffManagementScreen.dart';

// ignore: must_be_immutable
class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.action,
      required this.iconData,
      required this.onPressed});

  final String action;
  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          MediaQuery.sizeOf(context).width * 0.3,40,
        ),
        backgroundColor: kprimaryColor,
      ),
      onPressed: onPressed,
      icon: Icon(
        iconData,
        size: 20,
        color: kSecondryBackgroundColor,
      ),
      label: Text(
        action,
        style: Themes.bodyXLarge.copyWith(
          color: kSecondryBackgroundColor,
        ),
      ), // <-- Text
    );
  }
}
