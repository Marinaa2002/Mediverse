import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

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
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kprimaryColor),
      ),
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: kSecondryBackgroundColor,
        size: 20.0,
      ),
      label: Text(
        action,
        style: const TextStyle(
          color: kSecondryBackgroundColor,
        ),
      ), // <-- Text
    );
  }
}
