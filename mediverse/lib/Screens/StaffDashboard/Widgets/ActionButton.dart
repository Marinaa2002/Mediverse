import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Screens/StaffDashboard/HospitalStaffManagementScreen.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/HospitalStaffAccount.dart';

// ignore: must_be_immutable
class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.action, required this.iconData});

  final String action;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kprimaryColor),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const HospitalStaffManagementScreen()),
        );
      },
      icon: Icon(
        iconData,
        color: Colors.white,
        size: 20.0,
      ),
      label: Text(
        action,
        style: const TextStyle(
          color: Colors.white,
        ),
      ), // <-- Text
    );
  }
}
