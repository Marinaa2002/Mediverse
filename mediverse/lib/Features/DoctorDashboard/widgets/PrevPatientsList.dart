import 'package:flutter/material.dart';
import 'package:mediverse/screens/DoctorDashboard/widgets/HistoryCard.dart';

class PrevPatientsList extends StatelessWidget {
  const PrevPatientsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            HistoryCard(),
            HistoryCard(),
            HistoryCard(),
            HistoryCard(),
            HistoryCard(),
          ],
        ),
      ),
    );
  }
}
