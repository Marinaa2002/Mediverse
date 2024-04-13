import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/DateTimePicker.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/ActionButton.dart';

class SlotsAddWidgetRow extends StatelessWidget {
  const SlotsAddWidgetRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Slots',
          style: Themes.bodyMedium.copyWith(
            fontFamily: 'Readex Pro',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ActionButton(
          action: "Add",
          iconData: Icons.add_circle,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DateTimePicker()),
            );
          },
        ),
      ],
    );
  }
}
