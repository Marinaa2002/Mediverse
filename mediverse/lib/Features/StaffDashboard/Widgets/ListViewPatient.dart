import 'package:flutter/material.dart';

import 'PatientCard.dart';

class ListViewPatient extends StatelessWidget {
  const ListViewPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const MedicalCard(
          name: "Randy Orton",
          profile_Picture: '',
        );
      },
    );
  }
}
