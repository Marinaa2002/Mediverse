import 'package:flutter/material.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/PatientCard.dart';

class ListViewPatient extends StatelessWidget {
  const ListViewPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const PatientCard();
      },
    );
  }
}
